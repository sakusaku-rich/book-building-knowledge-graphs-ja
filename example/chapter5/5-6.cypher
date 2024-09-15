CALL apoc.mongodb.find(
  'mongodb://mongo:neo4j@mongo:27017', 
  'results',
  '2022-02-22-wetlab', 
  {`status`: 'failed'}, 
  null, 
  null
)
YIELD failed_experiments
MATCH (:Experiment {id: failed_experiments.id})-[*1..2]->(environmental_factors)
RETURN environmental_factors.contaminants AS contaminants