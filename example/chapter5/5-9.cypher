MATCH (aend:NetworkDevice)-[l:LINK]->(zend:NetworkDevice)
WHERE l.linkId = 's1_385/ol'
RETURN aend.code, zend.code