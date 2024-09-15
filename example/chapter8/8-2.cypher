MATCH (t:Task)-[:produces|consumes*2..]-(:Dataset)<-[:consumes]-(s:DataSink)-[:owned_by]->(o)
WHERE t.name = 'standardise_reference_fields'
RETURN s.id AS affectedDataConsumerID,
  s.type AS affectedDataConsumerType,
  s.desc AS affectedDataConsumerDesc,
  o.id AS ownerID,
  o.name AS ownerName