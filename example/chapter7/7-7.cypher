CALL gds.beta.pipeline.linkPrediction.configureSplit(
  'actors-pipeline', {
    testFraction: 0.25,
    trainFraction: 0.6,
    validationFolds: 3
  }
)