CALL gds.graph.project(
  'projects', {
	Incomplete: {},
	Project: {properties: ['rating']},
	Employee: {}
  }, {
	PARTICIPATED_IN: {orientation: 'UNDIRECTED'},
	REPORTS_TO: {orientation: 'UNDIRECTED'}
  }
)