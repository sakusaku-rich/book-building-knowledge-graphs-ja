MATCH (a1:Article)-[r1:references]->(e:Entity)<-[r2:references]-(a2:Article)
WITH a1, a2, sum(r1.salience * r2.salience) AS similarity_metric
MERGE (a1)-[:similar {metric: similarity_metric}]-(a2)