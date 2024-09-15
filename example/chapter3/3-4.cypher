MATCH (p:Person)-[:LIVES_IN]->(:Place { city: 'ベルリン', country: 'DE' })
RETURN (p)
