LOAD CSV WITH HEADERS FROM 'friend_rels.csv' AS line
MATCH (p1:Person {name: line.from})
MATCH (p2:Person {name: line.to})
MERGE (p1)-[:FRIEND]->(p2)