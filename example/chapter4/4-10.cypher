LOAD CSV WITH HEADERS FROM 'file:///4-9.csv' AS line
MATCH (p1:Person {name: line.from})
MATCH (p2:Person {name: line.to})
MERGE (p1)-[:FRIEND]->(p2)