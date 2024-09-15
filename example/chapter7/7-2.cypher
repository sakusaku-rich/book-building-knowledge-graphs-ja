MATCH (Keanu:Person {name: 'Keanu Reeves'})
MATCH (TheMatrix:Movie {title: 'The Matrix'})
RETURN gds.alpha.linkprediction.preferentialAttachment(
  Keanu,
  TheMatrix,
  {relationshipQuery: 'ACTED_IN'}
) AS score