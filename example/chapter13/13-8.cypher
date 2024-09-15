MATCH (p:Person)-[:WROTE]->(m:Movie)
WHERE toLower(m.title) CONTAINS 'a few good men'
WITH collect(p.name) AS answer_as_list
RETURN CASE 
		WHEN size(answer_as_list) > 0 THEN substring(reduce(result='', x in answer_as_list | result + ', ' + x),2) 
		ELSE "I cannot answer your question about 'a few good men'"
  END AS answer