MATCH (c:Concept)<-[:refers_to]-(a:Article)
WHERE date() - duration('P6M') < a.datetime < date()
RETURN c.label, count(a) AS freq
ORDER BY freq DESC
LIMIT 10