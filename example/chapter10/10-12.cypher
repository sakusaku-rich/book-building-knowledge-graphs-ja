MATCH (e:Employee)-[part:PARTICIPATED]->(p:Project)-[r:REQUIRES]->(s:Skill {name: 'Java'})
WITH p AS proj, e AS employee, part.end AS lastUsed, duration.inDays(part.start, part.end).days AS days
RETURN employee.name AS skill, sum(days) AS daysOfExperience, max(lastUsed) 
ORDER BY daysOfExperience DESC