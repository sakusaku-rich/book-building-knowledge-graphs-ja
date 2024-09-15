MATCH path = (lemma:Form)<-[:canonicalForm]-(:LexicalEntry)-[:sense]->()-[:isLexicalizedSenseOf]->()
WHERE lemma.writtenRep = 'clear'
RETURN path