MATCH (a:LexicalConcept {uri: $a_id})
MATCH (b:LexicalConcept {uri: $b_id })
MATCH p = (a)-[:hypernym*0..]->(lcs)<-[:hypernym*0..]-(b)
WITH a, b, lcs, length(p) AS pathLen
MATCH p = (lcs)-[:hypernym*0..]->(root)
WHERE NOT (root)-[:hypernym]->()
RETURN lcs.definition AS lcs_def, lcs.uri AS lcs_id, length(p) AS lcs_depth
ORDER BY pathLen
LIMIT 1