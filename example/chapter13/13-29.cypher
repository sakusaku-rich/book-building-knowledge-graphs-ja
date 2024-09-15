MATCH (a:LexicalConcept {uri: $a_id})
MATCH (b:LexicalConcept {uri: $b_id })
MATCH p = shortestPath((a)-[:hypernym*0..]-(b))
WITH a, b, length(p) AS pathLen
RETURN a.definition AS a_def, b.definition AS b_def, pathLen, 1.0/(1+pathLen) AS pathSim