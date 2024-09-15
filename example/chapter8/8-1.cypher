MATCH (d:Dataset)
WHERE (d)-[:associated_with]->(:Domain {name: 'Corporate Sales'})
  AND (d)-[:has_field]->(:Field)-[:associated_with]->(:CatalogTerm {name: 'location_info'})
RETURN d.id AS dataset_id,
 d.desc AS dataset_desc,
 d.type AS dataset_type,
 count{ (d)<-[:consumes]-(d:DataSink) } AS dataset_usage_count