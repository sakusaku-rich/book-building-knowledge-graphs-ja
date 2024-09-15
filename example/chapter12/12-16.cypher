LOAD CSV WITH HEADERS FROM 'file:///articles.csv' AS row
CREATE (a:Article {uri: row.uri})
SET a.title = row.title, a.body = row.body, a.datetime = datetime(row.date)