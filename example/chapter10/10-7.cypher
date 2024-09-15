MATCH (java:Skill {name: 'Java'})<-[:REQUIRES]-(:Project)<-[:PARTICIPATED_IN]-(ic:IC)
RETURN DISTINCT ic.name