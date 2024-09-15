MATCH (p1:Person)
MATCH (p2:Person)
WHERE p1.source <> p2.source
  AND (p1.ssn = p2.ssn OR p1.passport_no = p2.passport_no) 
  AND elementId(p1) > elementId(p2)
CREATE (p1)-[:SAME_AS {ssn_match: p1.ssn = p2.ssn, passport_match: p1.passport_no = p2.passport_no}]->(p2)