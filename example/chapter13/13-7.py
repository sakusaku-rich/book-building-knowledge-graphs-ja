import spacy
from spacy.matcher import Matcher

nlp = spacy.load("en_core_web_sm")
matcher = Matcher(vocab=nlp.vocab)
q1_pattern = [
    {"LOWER": "who"},
    {"LEMMA": {"IN": ["direct", "produce", "write", "review"]}, "POS": "VERB"},
    {"IS_ASCII": True, "OP": "+"},
    {"IS_PUNCT": True, "OP": "?"},
]

matcher.add("q_1", patterns=[q1_pattern])  # (1)
doc = nlp("do you know who wrote a few good men?")  # (2)
result = matcher(doc, as_spans=True)  # (3)
# トークンをグラフのスキーマにマッピングする
q1_verb_to_rel = {
    "direct": "DIRECTED",
    "produce": "PRODUCED",
    "write": "WROTE",
    "review": "REVIEWED",
}

max_match = result[-1]
verb = max_match[1].lemma_  # (1)
title = " ".join([tk.text for tk in max_match[2:] if tk.pos_ != "PUNCT"])  # (2)
query_as_cypher = (
    "MATCH (p:Person)-[:{rel_type}]->(m:Movie) "
    "WHERE toLower(m.title) CONTAINS '{movie_title}' "
    "WITH collect(p.name) AS answer_as_list "
    "RETURN CASE WHEN size(answer_as_list) > 0 THEN "
    " substring(reduce"
    "(result='', x in answer_as_list | result + ', ' + x),2) "
    ' ELSE "I cannot answer your question about '
    "'{movie_title}' \" end AS answer ".format(
        rel_type=q1_verb_to_rel[verb], movie_title=title.lower()
    )
)  # (3)

print(query_as_cypher)
