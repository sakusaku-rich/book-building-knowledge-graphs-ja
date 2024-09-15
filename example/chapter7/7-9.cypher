CALL gds.beta.pipeline.linkPrediction.train(
 'actors-graph', {
   pipeline: 'actors-pipeline',
   modelName: 'actors-model',
   metrics: ['AUCPR'],
   targetRelationshipType: 'ACTED_WITH',
   randomSeed: 73
 }
) YIELD modelInfo, modelSelectionStats
RETURN
 modelInfo.bestParameters AS winningModel,
 modelInfo.metrics.AUCPR.train.avg AS avgTrainScore,
 modelInfo.metrics.AUCPR.outerTrain AS outerTrainScore,
 modelInfo.metrics.AUCPR.test AS testScore, [
   cand IN modelSelectionStats.modelCandidates |
   cand.metrics.AUCPR.validation.avg
 ] AS validationScores