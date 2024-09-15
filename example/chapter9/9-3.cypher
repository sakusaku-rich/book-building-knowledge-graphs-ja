LOAD CSV WITH HEADERS FROM 'file:///ds1.csv' AS row
CREATE (p:Person)
SET p.source = 'ds1', p += properties(row);

LOAD CSV WITH HEADERS FROM 'file:///ds2.csv' AS row
CREATE (p:Person)
SET p.source = 'ds2', p += properties(row);

LOAD CSV WITH HEADERS FROM 'file:///ds3.csv' AS row
CREATE (p:Person)
SET p.source = 'ds3', p += properties(row);