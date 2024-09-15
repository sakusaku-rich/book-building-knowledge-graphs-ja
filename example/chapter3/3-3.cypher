// イギリスのロンドンを表すノードを作成、またはマッチ
// ノードを london という変数にバインドする
MERGE (london:Place { city: 'London', country: 'UK' })

// Fred を表すノードを作成、またはマッチ
// ノードを fred という変数にバインドする
MERGE (fred:Person { name: 'Fred' })

// fred と london のノードの間に :LIVES_IN リレーションを作成、またはマッチ
MERGE (fred)-[:LIVES_IN]->(london)

// Karl を表すノードを作成、またはマッチ
// ノードを karl という変数にバインドする
MERGE (karl:Person { name: 'Karl' })

// karl と london のノードの間に :LIVES_IN リレーションを作成、またはマッチ
MERGE (karl)-[:LIVES_IN]->(london)
