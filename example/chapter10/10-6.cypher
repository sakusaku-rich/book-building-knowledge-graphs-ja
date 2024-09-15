MATCH (:VP {name: 'Harry'})<-[:REPORTS_TO*1..2]-(n)
RETURN count(n) AS numberOfEmployees