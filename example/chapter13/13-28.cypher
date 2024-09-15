MATCH (lemma:Form)<-[:canonicalForm]-(:LexicalEntry)-[:sense]-> (s)-[:isLexicalizedSenseOf]->(con:LexicalConcept)
RETURN con.definition AS concept, count(lemma.writtenRep) AS wordCount, collect(lemma.writtenRep) AS words
ORDER BY wordCount DESC
LIMIT 10