MATCH (c:Concept)<-[:broader*0..]-(sc)<-[:refers_to]-(article:Article)
WHERE c.prefLabel = 'NoSQL database management system'
RETURN article.title AS searchResult