CALL gds.nodeSimilarity.stream('identity-sim', {similarityCutoff: 0.8}) YIELD node1, node2, similarity
WITH similarity, gds.util.asNode(node1) AS node1, gds.util.asNode(node2) AS node2
WHERE node1.source = 'GGL' AND node2.source = 'AMZ'
RETURN similarity AS tk_sim,
	apoc.text.jaroWinklerDistance(node1.name, node2.title) AS str_sim, 
	node1.name AS Prod1,
	node2.title AS Prod2