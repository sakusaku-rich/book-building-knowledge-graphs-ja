import spacy
from spacy.matcher import Matcher
from neo4j import GraphDatabase, basic_auth

driver = GraphDatabase.driver("bolt://localhost:7687", auth=basic_auth("neo4j", "neo"))
session = driver.session(database="data")  # 1


def query_db(session, cypher):  # 2
    results = session.read_transaction(lambda tx: tx.run(cypher).data())
    return results[0]["answer"]


nlp = spacy.load("en_core_web_sm")
matcher = Matcher(vocab=nlp.vocab)
q1_pattern = [
    {"LOWER": "who"},
    {"LEMMA": {"IN": ["direct", "produce", "write", "review"]}, "POS": "VERB"},
    {"IS_ASCII": True, "OP": "+"},
    {"IS_PUNCT": True, "OP": "?"},
]

q1_verb_to_rel = {
    "direct": "DIRECTED",
    "produce": "PRODUCED",
    "write": "WROTE",
    "review": "REVIEWED",
}
matcher.add("q_1", patterns=[q1_pattern])  # 3

q2_pattern = [
    {"LOWER": "when"},
    {"LEMMA": "be"},
    {"IS_ASCII": True, "OP": "+"},
    {"LEMMA": {"IN": ["release", "premiere"]}, "POS": "VERB", "OP": "?"},
    {"LEMMA": "out", "OP": "?"},
    {"IS_PUNCT": True, "OP": "?"},
]

q2_word_to_prop = {"release": "released", "premiere": "released", "out": "released"}
matcher.add("q_2", patterns=[q2_pattern])  # 4

q3_pattern = [
    {"LOWER": "who"},
    {
        "LEMMA": {"IN": ["act", "perform", "appear", "be"]},
        "POS": {"IN": ["VERB", "AUX"]},
    },
    {"LEMMA": "in"},
    {"IS_ASCII": True, "OP": "+"},
    {"IS_PUNCT": True, "OP": "?"},
]

matcher.add("q_3", patterns=[q3_pattern])  # 5


def process_question(question):  # 6
    doc = nlp(question)
    result = matcher(doc, as_spans=True)

    if len(result) > 0:
        max_match = result[-1]
        pattern_detected = nlp.vocab[max_match.label].text  # 7

        if pattern_detected == "q_1":
            verb = max_match[1].lemma_
            title = " ".join([tk.text for tk in max_match[2:] if tk.pos_ != "PUNCT"])
            query_as_cypher = (
                "MATCH (p:Person)-[:{rel_type}]->(m:Movie) "
                "WHERE toLower(m.title) CONTAINS '{movie_title}' "
                "WITH COLLECT(p.name) AS answer_as_list "
                "RETURN CASE WHEN size(answer_as_list) > 0 THEN "
                " substring(reduce(result='', x in answer_as_list"
                " | result + ', ' + x),2) "
                ' ELSE "I cannot answer your question about '
                "'{movie_title}' \" end AS answer ".format(
                    rel_type=q1_verb_to_rel[verb], movie_title=title.lower()
                )
            )
        elif pattern_detected == "q_2":
            word_pos = -2 if max_match[-1].is_punct else -1
            word = max_match[word_pos].lemma_
            title = " ".join([tk.text for tk in max_match[2:word_pos]])
            query_as_cypher = (
                "MATCH (m:Movie) "
                "WHERE toLower(m.title) CONTAINS '{movie_title}' "
                "WITH collect(m.{movie_prop}) AS answer_as_list "
                "RETURN CASE WHEN size(answer_as_list) > 0 THEN "
                " substring(reduce(result='', x in answer_as_list"
                " | result + ', ' + x),2) "
                ' ELSE "I cannot answer your question about '
                "'{movie_title}' \" end AS answer ".format(
                    movie_prop=q2_word_to_prop[word], movie_title=title.lower()
                )
            )
        elif pattern_detected == "q_3":
            title = " ".join([tk.text for tk in max_match[3:-1]])
            query_as_cypher = (
                "MATCH (p:Person)-[:ACTED_IN]->(m:Movie) "
                "WHERE toLower(m.title) CONTAINS '{movie_title}' "
                "WITH collect(p.name) AS answer_as_list "
                "RETURN CASE WHEN size(answer_as_list) > 0 THEN"
                " substring(reduce(result='', x in answer_as_list |"
                " result + ', ' + x),2) "
                ' ELSE "I cannot answer your question about '
                "'{movie_title}' \" end AS answer ".format(movie_title=title.lower())
            )

        print("Q:", question)
        print("A:", query_db(session, query_as_cypher))
        print("Explain:", query_as_cypher[:90], "...\n")


questions = [
    "could you tell me who reviewed the Da Vinci code?",
    "who directed unforgiven ?",
    "do you happen to know who appears in Jerry Maguire?",
    "Who acts in Apollo 13?",
    "tell me when was the birdcage released",
    "do you know who produced the matrix reloaded?",
    "do you remember who was in cloud atlas?",
    "name the person who wrote When Harry Met Sally",
    "when was top gun out?",
]  # 8

for question in questions:
    process_question(question)  # 9

driver.close()