CALL gds.alpha.pipeline.nodeRegression.predict.stream(
  'projects', 
  {modelName: 'projects-pipeline-model', targetNodeLabels: ['Incomplete']}
) YIELD nodeId, predictedValue
WITH gds.util.asNode(nodeId) AS projectNode, predictedValue AS predictedRating
RETURN projectNode.name AS name, predictedRating
ORDER BY predictedRating ASC
LIMIT 10