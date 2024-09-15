MATCH (a:LexicalConcept {uri: $a_id})
MATCH (b:LexicalConcept {uri: $b_id })
MATCH (lcs:LexicalConcept {uri: $lcs_id })
MATCH a_to_lcs = (a)-[:hypernym*0..]->(lcs)
MATCH b_to_lcs = (b)-[:hypernym*0..]->(lcs)
WITH a, b, lcs, length(a_to_lcs) AS depth_a, length(b_to_lcs) AS depth_b
RETURN (2.0 * $lcs_depth) / (2.0 * $lcs_depth + depth_a + depth_b) AS wp_sim