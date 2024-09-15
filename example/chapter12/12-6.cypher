MATCH (c:Entity {name: $entityName, type: $entityType})
WITH c, date() - duration('P1Y') AS startdate
UNWIND range(0, 11) AS increment
MATCH (c)<-[:references]-(a:Article)
WHERE startdate + duration('P' + (increment - 1) + 'M') < a.published < startdate + duration('P' + increment + 'M')
RETURN startdate + duration('P' + increment + 'M') AS date, count(a)