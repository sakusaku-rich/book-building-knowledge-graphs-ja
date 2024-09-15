MATCH (a1:Article)-[r1:references]->(e:Entity)<-[r2:references]-(a2:Article)
WHERE a1.url = $url1 AND a2.url = $url2
RETURN sum(r1.salience * r2.salience) AS similarity_metric