MATCH cycle = (e:Element)-[d:DEPENDS_ON*]->(e)
RETURN cycle