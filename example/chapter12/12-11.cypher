MATCH (a1:Article)-[r:similar]-(recommendation)
WHERE a1.url = $url1
RETURN recommendation, r.metric AS similarity_metric
ORDER BY similarity_metric DESC
LIMIT 5