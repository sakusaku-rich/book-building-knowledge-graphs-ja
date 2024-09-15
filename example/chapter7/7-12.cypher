CALL gds.beta.graph.relationships.stream(
  'actors-input-graph-for-prediction',
  ['SHOULD_ACT_WITH']
) YIELD sourceNodeId, targetNodeId
WITH gds.util.asNode(sourceNodeId) AS source, gds.util.asNode(targetNodeId) AS target
MERGE (source)-[:SHOULD_ACT_WITH]->(target)