CALL gds.beta.pipeline.linkPrediction.predict.mutate(
 'actors-input-graph-for-prediction', {
   modelName: 'actors-model',
   relationshipTypes: ['ACTED_WITH'],
   mutateRelationshipType: 'SHOULD_ACT_WITH',
   topN: 20,
   threshold: 0.4
 }
) YIELD relationshipsWritten, samplingStats