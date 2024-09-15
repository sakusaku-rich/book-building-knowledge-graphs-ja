LOAD CSV WITH HEADERS FROM 'friend_rels.csv' AS line
MATCH (person:Person {name: line.from})
MATCH (place:Place {city: line.to})
MERGE (person)-[r:LIVES_IN]->(place)
SET r.since = line.since