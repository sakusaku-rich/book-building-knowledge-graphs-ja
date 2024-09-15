MATCH (:Person)
WITH count(*) AS count
MATCH (a:Person)-[*2..4]-(b:Person)
WHERE rand() < 10.0 / count
RETURN a