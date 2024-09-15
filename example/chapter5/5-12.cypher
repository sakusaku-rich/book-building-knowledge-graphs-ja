MATCH (aend:NetworkDevice)-[l:LINK]->(zend:NetworkDevice)
WHERE l.linkId = 's1_385/ol'
WITH aend, zend
CALL apoc.dv.query('metrics-by-device-id', {device_id: aend.nd_id}) YIELD node
RETURN aend.code, properties(node), zend.code