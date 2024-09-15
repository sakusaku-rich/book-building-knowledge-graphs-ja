CALL gds.alpha.pipeline.nodeRegression.train(
  'projects', {
    pipeline: 'projects-pipeline',
	  targetNodeLabels: ['Project'], 
	  modelName: 'projects-pipeline-model', 
	  targetProperty: 'rating',
	  randomSeed: 1,
	  concurrency: 4,
	  metrics: ['MEAN_SQUARED_ERROR']
  }
)