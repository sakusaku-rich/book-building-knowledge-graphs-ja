MATCH (lemma:Form)<-[:canonicalForm]-(le:LexicalEntry)-[:sense]->()-[:isLexicalizedSenseOf]->(concept)
WHERE lemma.writtenRep = 'clear'
RETURN le.partOfSpeech AS PoS, concept.definition AS definition