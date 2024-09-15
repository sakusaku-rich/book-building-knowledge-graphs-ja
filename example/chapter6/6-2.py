from graphdatascience import GraphDataScience

# データベースに接続
host = "bolt://127.0.0.1:7687"
user = "neo4j"
password = "yolo"
gds = GraphDataScience(host, auth=(user, password), database="neo4j")

# 駅をノードとして読み込む
gds.run_cypher(
    """\
LOAD CSV WITH HEADERS FROM 'nr-stations-all.csv' AS station
CREATE (:Station {name: station.name, crs: station.crs})
"""
)
# 駅の間の線路をリレーションとして読み込む
gds.run_cypher(
    """\
LOAD CSV WITH HEADERS FROM 'nr-station-links.csv' AS track
MATCH (from:Station {crs: track.from})
MATCH (to:Station {crs: track.to})
MERGE (from)-[:TRACK {distance: round(toFloat(track.distance), 2 )}]->(to)
"""
)
gds.close()