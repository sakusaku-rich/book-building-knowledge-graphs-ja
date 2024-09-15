WITH 'file:///qualified-dependencies.csv' AS data
LOAD CSV WITH HEADERS FROM data AS row
MERGE (a:Element {id: row.element})
MERGE (b:Element {id: row.depends_on})
MERGE (a)-[do:DEPENDS_ON]->(b)
  ON CREATE SET do.abs = toInteger(row.abs), do.mode = row.mode