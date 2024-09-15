MATCH (:Organization {name: 'Inovia Capital'})-[rel]-(p:Person)
RETURN p.name AS person, type(rel) AS rel_type