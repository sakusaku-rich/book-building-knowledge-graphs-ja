CALL gds.graph.project(
  'actors-graph', {
    Person: {}
  }, {
    ACTED_WITH: {
    	orientation: 'UNDIRECTED'
    }
  }
)