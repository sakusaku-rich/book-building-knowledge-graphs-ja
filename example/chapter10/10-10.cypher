MATCH (:Employee {name: 'Rosa'})-[part:PARTICIPATED]->(p:Project)-[r:REQUIRES]->(s:Skill)
WITH p AS proj, s AS skill, part.end AS lastUsed, duration.inDays(part.start, part.end).days AS days
RETURN skill.name AS skill, sum(days) AS daysOfExperience, max(lastUsed)
ORDER BY daysOfExperience DESC