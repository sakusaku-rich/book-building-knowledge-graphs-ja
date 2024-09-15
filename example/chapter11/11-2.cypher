LOAD CSV WITH HEADERS FROM 'file:///dependencies.csv' AS row
MERGE (a:Element {id: row.element})
MERGE (b:Element {id: row.depends_on})
MERGE (a)-[:DEPENDS_ON]->(b)