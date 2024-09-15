:params {declared: ['I', 'K', 'J'], current:'F'};

MATCH (e:Element {id: $current})-[d:DEPENDS_ON {mode: 'RED'}]->(dependee)
WITH e.id AS element, 
  dependee.id AS dependee,
  CASE
    WHEN dependee.id IN $declared THEN 1 
    ELSE 0 
  END AS partial_impact
RETURN element, min(partial_impact) AS derived_impact