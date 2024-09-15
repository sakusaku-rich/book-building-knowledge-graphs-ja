MATCH (s:DataSink)-[:consumes]->(:Dataset)-[:produces|consumes*2..]->(raw:Dataset)-[:source]->(dp:DataPlatform)
WHERE s.type = 'Dashboard' AND s.id = 'X'
RETURN raw.id AS sourceDatasetID,
  raw.type AS sourceDatasetType,
  dp.id AS sourcePlatformID,
  dp.type AS sourcePlatformType