LOAD CSV WITH HEADERS FROM 'people.csv' AS line CALL {
  WITH line
  MERGE (p:Person {name: line.name})
  SET p.age = line.age
  SET p.gender = line.gender
} IN TRANSACTIONS OF 1 ROWS