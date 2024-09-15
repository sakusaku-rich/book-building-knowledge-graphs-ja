UNWIND $events AS event
MERGE (source:Person {name: event.source.name})
SET source = event.source
MERGE (target:Product {name: event.target.name})
SET target = event.target
CREATE (source)-[rel:FOLLOWS]->(target)
SET rel += event.rel