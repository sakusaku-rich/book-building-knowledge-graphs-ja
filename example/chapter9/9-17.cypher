LOAD CSV WITH HEADERS FROM 'file:///amz.csv' AS row
CREATE (p:Product {sid: row.id})
SET p.source = 'AMZ', p += properties(row);

LOAD CSV WITH HEADERS FROM 'file:///ggl.csv' AS row
CREATE (p:Product {sid: row.id})
SET p.source = 'GGL', p += properties(row);