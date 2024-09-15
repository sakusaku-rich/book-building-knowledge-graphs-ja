:param symptoms => ['N', 'O', 'P', 'H', 'I', 'A', 'E'];

MATCH (e:Element)-[:DEPENDS_ON*0..]->(x)
WHERE e.id in $symptoms AND NOT (x)-[:DEPENDS_ON]->()
WITH x, collect(DISTINCT e.id) AS explains_faults
WHERE size(explains_faults) > 1
RETURN x.id AS candidate_root, explains_faults
ORDER BY size(explains_faults) DESC