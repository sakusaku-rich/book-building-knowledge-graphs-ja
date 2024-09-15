MATCH (p1:Person)
MATCH (p2:Person)
WHERE NOT (p1)-[:SAME_AS]-(p2)
  AND p1.source <> p2.source 
  AND elementId(p1) > elementId(p2)
  AND apoc.text.jaroWinklerDistance(p1.m_fullname, p2.m_fullname) < 0.2
CREATE (p1)-[:SIMILAR {sim_score: 1 - apoc.text.jaroWinklerDistance(p1.m_fullname, p2.m_fullname)}]->(p2)