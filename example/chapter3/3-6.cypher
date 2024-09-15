MATCH (rosa:Person{ name: 'Rosa' })-[FRIEND*2..2]->(fof:Person)
WHERE rosa <> fof
RETURN (fof)
