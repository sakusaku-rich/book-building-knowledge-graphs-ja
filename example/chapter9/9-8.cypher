MATCH (p1:Person)-[sim:SIMILAR]->(p2:Person)
WHERE p1.ssn <> p2.ssn OR p1.passport_no <> p2.passport_no
DELETE sim