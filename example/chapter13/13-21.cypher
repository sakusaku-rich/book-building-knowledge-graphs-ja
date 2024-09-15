MATCH (n)-[r]-(o)
WHERE elementId(n) = $entity_id
MATCH (cn:Class)<-[:domain|range]-(op:ObjectProperty)-[:domain|range]->(co:Class)
WHERE type(r) IN op.label
  AND (op.direct IS NOT NULL OR op.inverse IS NOT NULL)
  AND [x in labels(n) where x <> 'Resource'][0] IN cn.label 
  AND [x in labels(o) where x <> 'Resource'][0] IN co.label
WITH n[cn.name[0]] AS subj,
  n10s.rdf.getLangValue('default', op[CASE WHEN startNode(r) = n THEN 'direct' ELSE 'inverse' END]) AS pred,
  substring(reduce(res='', x IN collect(o[co.name[0]]) | res + ',' + x), 1) AS obj
WITH CASE WHEN pred CONTAINS '$s' THEN '' ELSE subj end AS subj,
  replace(replace(pred, '$o', obj), '$s', subj) AS pred,
  CASE WHEN pred CONTAINS '$o' THEN '' ELSE obj end AS obj
RETURN subj + ' ' + pred + ' ' + obj AS sentence