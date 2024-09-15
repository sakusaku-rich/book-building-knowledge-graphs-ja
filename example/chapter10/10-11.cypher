MATCH (me:Employee {name: 'Rosa'})-[:PARTICIPATED]->(:Project)<-[:PARTICIPATED]-(other:Employee)
MATCH (other)-[:PARTICIPATED]->(:Project)-[:REQUIRES]->(s:Skill)
WHERE NOT (me)-[:PARTICIPATED]->(:Project)-[:REQUIRES]->(s)
WITH s AS skill, count(s) AS popularity
RETURN DISTINCT skill.name, popularity
ORDER BY popularity DESC