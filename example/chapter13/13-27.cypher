MATCH (lemma:Form)
RETURN lemma.writtenRep AS lemma, COUNT{(lemma)<-[:canonicalForm]-(:LexicalEntry)-[:sense]->()} AS senseCount
ORDER BY senseCount DESC
LIMIT 5