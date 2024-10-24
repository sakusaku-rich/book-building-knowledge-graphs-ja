LOAD CSV WITH HEADERS FROM 'file:///4-7.csv' AS line
MERGE (p:Person { name: line.name })
SET p.age = line.age
SET p.gender = line.gender
