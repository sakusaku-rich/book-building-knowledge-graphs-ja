MATCH (a1:Article)-[r1:references]->(e:Entity)<-[r2:references]-(recommendation)
WHERE a1.url = $url1
RETURN recommendation, sum(r1.salience * r2.salience) AS similarity_metric, collect(e) AS explanation
ORDER BY similarity_metric DESC
LIMIT 5