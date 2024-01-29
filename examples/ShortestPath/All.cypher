//All
CALL gds.graph.project(
    'ShortestPath',
    '*',
    {
    relType: {
      type: '*',
      orientation: 'UNDIRECTED',
      properties: {}
    }
  },
    {});