CALL gds.graph.project(
  'fraud-wcc',
  ['Person', 'Phone', 'Address'],
  ['LIVES_AT', 'OWNS']
)