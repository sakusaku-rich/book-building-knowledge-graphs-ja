CALL {
  MATCH ring = (p1:Person)-[:OWNS|LIVES_AT*5..]-(p2:Person)
  WHERE p1 <> p2
  RETURN ring
} IN TRANSACTIONS OF 100 ROWS
RETURN ring