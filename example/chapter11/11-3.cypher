MATCH path = (:Element {id: 'A'})-[:DEPENDS_ON*]->(:Element {id: 'F'})
RETURN path