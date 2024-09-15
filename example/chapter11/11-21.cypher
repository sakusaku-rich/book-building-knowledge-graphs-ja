MATCH (e:Element)-[:DEPENDS_ON*0..]->(x)
WHERE e.id IN $symptoms AND NOT (x)-[:DEPENDS_ON]->()
WITH x, collect(DISTINCT e.id) AS explains_faults
WHERE size(explains_faults) > 1
WITH x AS candidate_root, explains_faults
MATCH (candidate_root)<-[:DEPENDS_ON*0..]-(x)
WITH candidate_root, explains_faults, collect(DISTINCT x.id) AS potential_max_impact
WITH candidate_root, 
  toFloat(size(explains_faults)) / size($symptoms) AS precision, 
  toFloat(size([x in potential_max_impact WHERE x in $symptoms])) / size(potential_max_impact) AS recall
RETURN candidate_root.id, 
  precision,
  recall,
  (2 * precision * recall) / (precision + recall ) AS fscore
ORDER BY fscore DESC