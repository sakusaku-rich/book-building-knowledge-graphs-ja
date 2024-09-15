UNWIND ['Rosa', 'Hugo', 'Eve', 'Petra', 'Mark'] AS candidate
MATCH (me:Employee {name: candidate})
MATCH (me)-[r1:RATED]->(other:Employee)
MATCH (me)<-[r2:RATED]-(other:Employee) 
WITH me AS myself,
  (reduce(score = 0, r in r1.ratings | score + r) / size(r1.ratings) + reduce(score = 0, r in r2.ratings | score + r) / size(r2.ratings)) / 2 AS score, 
  other AS them, 
  r1, 
  r2
WHERE score >= 5
RETURN myself, them, score, r1, r2