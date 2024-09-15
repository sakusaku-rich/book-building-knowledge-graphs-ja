MATCH (a:Person)-[:SHOULD_ACT_WITH]->(b:Person)-[d:SHOULD_ACT_WITH]->(a)
// 特定のノードについて、最初に a、次に b として一致するパターンを防ぎ、
// すべてのリレーションを削除できるようにする。
WHERE id(a) > id(b)
DELETE d