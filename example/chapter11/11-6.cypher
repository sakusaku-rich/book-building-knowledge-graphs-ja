:param declared => ['I', 'K', 'J'];

MATCH (e:Element)-[:DEPENDS_ON*]->(impacted)
WHERE impacted.id IN $declared
RETURN collect(DISTINCT e.id) AS max_impact_list