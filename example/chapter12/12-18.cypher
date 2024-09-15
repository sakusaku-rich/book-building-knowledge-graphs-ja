CALL apoc.periodic.iterate(
  'MATCH (a:Article) WHERE a.processed IS NULL RETURN a', // (1) 
  "CALL apoc.nlp.gcp.entities.stream([item in $_batch | item.a], {	// (2) nodeProperty: 'body',
    key: $key
  }) YIELD node, value
  SET node.processed = true	// (3)
  WITH node, value
  UNWIND value.entities AS entity	// (4)
  WITH entity, node
  WHERE NOT (entity.metadata.wikipedia_url IS NULL)
  MATCH (c:Concept {altLabel: entity.metadata.wikipedia_url}) // (5)
  MERGE (node)-[rt:refers_to]->(c) // (6)
  SET rt.salience = entity.salience", {
    batchMode: 'BATCH_SINGLE', 
    batchSize: 10, 
    params: {key: $key}
  }
) YIELD batches, total, timeTaken, committedOperations
RETURN batches, total, timeTaken, committedOperations