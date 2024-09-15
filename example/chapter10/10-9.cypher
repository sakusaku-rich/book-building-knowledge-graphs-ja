MATCH (m:Message)-[:POSTED]->(c:Channel)-[:TOPIC]->(s:Skill {name: 'IL'})<-[:MENTIONS]-(m)
MATCH (m)<-[:REPLY*]-(r:Message)<-[:POSTED]-(u:User)
WITH u AS user, count(r) AS replies, s AS skill, collect(DISTINCT c.name) AS channel
RETURN skill.name, user.name, replies, size(channel) AS numberOfChannels
ORDER BY replies DESC