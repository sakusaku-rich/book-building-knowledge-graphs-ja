UNWIND ['globalsales.apac', 'globalsales.emea'] AS g
CALL {
  USE graph.byName(g)
  MATCH (c:Customer)-[:PURCHASED]->()-[o:ORDERS]->(:Product)
  WITH c, sum(o.quantity * o.unitPrice) AS totalOrdered
  WHERE totalOrdered > 100000
  RETURN c.customerID AS name, c.country AS country, totalOrdered
}
RETURN name, country, totalOrdered