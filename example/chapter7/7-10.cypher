CALL gds.graph.project(
 'actors-input-graph-for-prediction', {
   Person: {}
 }, {
   ACTED_WITH: {
     orientation: 'UNDIRECTED'
   }
 }
)