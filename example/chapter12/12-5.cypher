MATCH (a:Article)-[:references]->(e:Entity)
WHERE e.name = $entityName AND e.type = $entityType
RETURN a.url AS articleLink, a.title AS articleTitle