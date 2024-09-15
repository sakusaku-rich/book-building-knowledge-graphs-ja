CALL gds.beta.pipeline.linkPrediction.addFeature(
  'actors-pipeline',
  'cosine', {
    nodeProperties: ['embedding']
  }
) YIELD featureSteps