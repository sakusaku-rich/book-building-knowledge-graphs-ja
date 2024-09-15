CALL gds.wcc.stream('identity-wcc') YIELD nodeId, componentId
WITH gds.util.asNode(nodeId) AS person, componentId AS golden_id
MERGE (pg:PersonMaster {uid: golden_id})
  ON CREATE SET pg.fullname = person.m_fullname, pg.ssn = person.ssn, pg.passport_no = person.passport_no
  ON MATCH SET pg.ssn = coalesce(pg.ssn, person.ssn), pg.passport_no = coalesce(pg.passport_no, person.passport_no)
MERGE (pg)-[:HAS_REFERENCE]->(person)