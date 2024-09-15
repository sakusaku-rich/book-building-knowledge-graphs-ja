CALL gds.nodeSimilarity.stream('identity-sim', {similarityCutoff: 0.8}) YIELD node1, node2, similarity
WITH similarity, gds.util.asNode(node1) AS node1, gds.util.asNode(node2) AS node2
WHERE node1.source = 'GGL' AND node2.source = 'AMZ'
MERGE (node1)-[:SIMILAR {sim_score: similarity}]->(node2)