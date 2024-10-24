LOAD CSV WITH HEADERS FROM 'file:///4-5.csv' AS line
MERGE (:Place { country: line.country, city: line.city })
