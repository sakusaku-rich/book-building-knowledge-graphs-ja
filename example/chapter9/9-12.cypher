CALL gds.wcc.stream('identity-wcc') YIELD nodeId, componentId
WITH gds.util.asNode(nodeId) AS person, componentId AS golden_id 
RETURN golden_id, person.m_fullname, person.passport_no, person.ssn
ORDER BY golden_id