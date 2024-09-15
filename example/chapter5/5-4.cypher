CALL {
  USE globalsales.catalog
  MATCH (p:Product {discontinued: false})-[:PART_OF]->(:Category {categoryName: '飲料'})
  RETURN COLLECT(p.productID) AS pids
}
WITH pids, [g IN fabricnw.graphIds()] AS gids
UNWIND gids AS gid
CALL {
  USE globalsales.graph(gid)
  MATCH (c:Customer)-[:PURCHASED]->()-[o:ORDERS]->(p:Product)
  WHERE p.productID
  RETURN distinct c.customerID AS name, c.country AS country, p.productName AS product
}
RETURN name, country, product