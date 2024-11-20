CALL gds.beta.pipeline.linkPrediction.train.estimate(
  'actors-graph', {
    pipeline: 'actors-pipeline',
    modelName: 'actors-model',
    targetRelationshipType: 'ACTED_WITH'
  }
) YIELD requiredMemory