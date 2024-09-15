CREATE INDEX FOR (w:Word) ON w.txt;

MATCH (p:Product {source: 'GGL'})
UNWIND [x in split(apoc.text.replace(tolower(p.name), '[^a-zA-Z0-9]', ' '), ' ') WHERE x <> ''] AS txt
MERGE (w:Word {txt: txt})
MERGE (p)-[:includes]->(w);

MATCH (p:Product {source : 'AMZ'})
UNWIND [x in split(apoc.text.replace(tolower(p.title), '[^a-zA-Z0-9]', ' '), ' ') WHERE x <> ''] AS txt
MERGE (w:Word {txt: txt})
MERGE (p)-[:includes]->(w);