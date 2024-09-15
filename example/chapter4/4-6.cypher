LOAD CSV WITH HEADERS FROM 'places.csv' AS line
MERGE (:Place { country: line.country, city: line.city })
