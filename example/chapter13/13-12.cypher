MATCH (x)-[r]->(y)
RETURN x.name + ' ' + toLower(replace(type(r), '_', ' ')) + ' ' + y.name AS sentence