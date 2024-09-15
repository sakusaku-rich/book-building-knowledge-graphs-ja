CALL gds.beta.pipeline.linkPrediction.addNodeProperty(
  'actors-pipeline',
  'fastRP', {
    mutateProperty: 'embedding',
    embeddingDimension: 256,
    randomSeed: 42
  }
)