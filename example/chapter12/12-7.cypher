MATCH (a1:Article)-[:references]->(e:Entity)<-[:references]-(a2:Article)
WHERE a1.url = $url1 AND a2.url = $url2
RETURN e.name AS entityName, e.type AS entityType