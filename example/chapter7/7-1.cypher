MATCH (:Person {name: 'Keanu Reeves'})-[r:ACTED_IN]->(:Movie {title: 'The Matrix'})
DELETE r