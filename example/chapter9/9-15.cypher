MATCH (p:PersonMaster)-[:HAS_REFERENCE]->(ref)
WHERE p.passport_no = 'A465901'
WITH p, collect({source: ref.source, details: properties(ref)}) AS refs
RETURN {master_entity_id: p.uid, references: refs }