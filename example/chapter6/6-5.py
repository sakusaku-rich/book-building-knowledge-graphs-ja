from graphdatascience import GraphDataScience

host = "bolt://127.0.0.1:7687"
user = "neo4j"
password = "yolo"

gds = GraphDataScience(host, auth=(user, password), database="neo4j")
graph = gds.graph.get("trains")
result = gds.betweenness.stream(graph)
highest_score = result.sort_values(by="score", ascending=False).iloc[0:1].get("nodeId")

n = gds.run_cypher(
    f"""\
MATCH (s:Station)
WHERE ID(s) = {int(highest_score)}
RETURN s.name"""
)
print("中心性が最も高い駅: %s" % n["s.name"][0])

gds.close()
