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
print(result)
# 出力結果
# who wrote a
# who wrote a few
# who wrote a few good
# who wrote a few good men
# who wrote a few good men?
