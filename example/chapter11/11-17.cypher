MATCH (e:Element)-[d:DEPENDS_ON {mode: 'RED'}]->()
WITH e, count(d) AS available_redundant_elements
RETURN e.id AS element_id, available_redundant_elements > e.threshold AS valid