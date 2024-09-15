CALL gds.graph.project.cypher(
 'gds-example-graph',
 'MATCH (p:Person)
  RETURN id(p) AS id',
 "MATCH (p1:Person)-[:FRIEND]->(p2:Person)
  RETURN id(p1) AS source, id(p2) AS target, 'FRIEND' AS type"
)
  
CALL gds.betweenness.write(
   'gds-example-graph', {
       writeProperty: 'betweennessCentrality'
   }
)