MATCH p = (lc:LexicalConcept {uri: 'https://en-word.net/id/oewn-06578068-n'})<-[:hypernym]-()<-[:isLexicalizedSenseOf]-(ls)<-[:sense]-(le)-[:canonicalForm]->(f)
RETURN p