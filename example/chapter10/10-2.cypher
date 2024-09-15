CALL gds.louvain.stream('fraud-wcc')
YIELD nodeId, communityId
WITH gds.util.asNode(nodeId) AS person, communityId
SET person.communityId = communityId