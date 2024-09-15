CALL gds.beta.pipeline.linkPrediction.train.estimate(
  'actors-graph', {
    pipeline: 'actors',
    modelName: 'actors-model',
    targetRelationshipType: 'ACTED_WITH'
  }
) YIELD requiredMemory