MATCH households = (p:Person)-[:LIVES_AT]->(:Address)<-[:LIVES_AT]-(:Person)-[:OWNS]->(:Phone)<-[:OWNS]-(p)
RETURN households