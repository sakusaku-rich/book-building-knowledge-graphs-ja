MATCH path = (leaf:LexicalConcept)-[:hypernym*0..]->(root)
WHERE NOT EXISTS (()-[:hypernym]->(leaf)) AND NOT EXISTS ((root)-[:hypernym]->())
RETURN max(length(path)) AS maxTaxonomyDepth