from graphdatascience import GraphDataScience

host = "bolt://127.0.0.1:7687"
user = "neo4j"
password = "yolo"

gds = GraphDataScience(host, auth=(user, password), database="neo4j")
graph = gds.graph.get("trains")
result = gds.betweenness.write(gds.graph.get("trains"), writeProperty="betweenness")

total_stations = gds.run_cypher(
    """\
MATCH (s:Station)
RETURN count(s) AS total_stations"""
)
print(f"駅の総数: {total_stations.iloc[0][0]}")

processed_stations = gds.run_cypher(
    """\
MATCH (s:Station)
WHERE s.betweenness IS NOT NULL
RETURN count(s) AS stations_processed"""
)
print(f"媒介スコアを持つ駅の数: {processed_stations.iloc[0][0]}")
gds.close()
