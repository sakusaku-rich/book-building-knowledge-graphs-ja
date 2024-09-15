MATCH alertPath = (spof)<-[:DEPENDS_ON*]-(e:Element)-[:DEPENDS_ON*]->(spof)
WHERE e.id = $selected_node_id
RETURN alertPath