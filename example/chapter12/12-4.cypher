MATCH (a1:Article)-[:references]->(e:Entity)
WHERE a1.url = $url
RETURN e.name AS entityName, e.type AS entityType