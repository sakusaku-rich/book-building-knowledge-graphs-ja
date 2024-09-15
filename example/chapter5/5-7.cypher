WITH 'https://example.org/karl.json' AS url
CALL apoc.load.json(url) YIELD value
UNWIND value.products AS product
WITH product
MATCH (k:Person {name: 'Karl'})
MERGE (k)-[:BOUGHT]->(:Product {name: product.name, price: product.price, description: product.description})