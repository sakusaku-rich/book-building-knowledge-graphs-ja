CALL gds.alpha.pipeline.nodeRegression.addNodeProperty(
  'projects-pipeline',
  'fastRP', {
    embeddingDimension: 256,
	iterationWeights: [0, 1], 
	mutateProperty: 'fastrp-embedding', 
	contextNodeLabels: ['Project']
  }
)