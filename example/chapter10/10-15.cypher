MATCH (p:Project)<-[:PARTICIPATED_IN]-(:IC)-[:REPORTS_TO*3..3]->(svp:SVP)
WHERE p.rating < 30.0
RETURN svp, count(p) AS failedProjects
ORDER BY failedProjects DESC