public class GetNodeDegrees {
  @Context public GraphDatabaseService graphDatabaseService;

  @Procedure(value = "getNodeDegrees")
  @Description("Get degrees of all nodes in the knowledge graph")
  public Stream<NodeDegree> getNodeDegrees() {
    Map<Long, Long> nodeDegrees = new TreeMap<>(Long::compare);

    graphDatabaseService.getAllNodes().forEach(n -> {
      final long nodeDegree = n.getDegree();
      long numberOfNodeWithCurrentDegree =
          nodeDegrees.getOrDefault(nodeDegree, 0L);
      nodeDegrees.put(nodeDegree, numberOfNodeWithCurrentDegree + 1);
    });

    final Stream.Builder<NodeDegree> streamBuilder = Stream.builder();
    for (Map.Entry<Long, Long> entry : nodeDegrees.entrySet()) {
      streamBuilder.add(new NodeDegree(entry.getKey(), entry.getValue()));
    }

    return streamBuilder.build();
  }

  public class NodeDegree {
    public Long degree;
    public Long numberOfNodes;

    public NodeDegree(Long key, Long value) {
      degree = key;
      numberOfNodes = value;
    }
  }
}