UNWIND ['Rosa', 'Hugo', 'Eve', 'Petra', 'Mark'] AS candidate
MATCH (me:Employee {name: candidate}) 
MATCH (me)-[r1:RATED]->(other:Employee) 
MATCH (me)<-[r2:RATED]-(other:Employee) 
WITH me.name AS myself,
  reduce (score = 0, r in r1.ratings | score + r) / size(r1.ratings) AS s1, 
  reduce (score = 0, r in r2.ratings | score + r) / size(r2.ratings) AS s2,
  other.name AS them
RETURN myself, them, (s1 + s2) / 2 AS score 
ORDER BY myself, score DESC