MATCH (:Person { name: 'Rosa' })-[:FRIEND*2..2]->(fof:Person)
RETURN (fof)
