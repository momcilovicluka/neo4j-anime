//Related projection
CALL gds.graph.project(
  'RelatedAnime',
  'Anime',
  {
    relType: {
      type: 'RELATED_TO',
      orientation: 'UNDIRECTED',
      properties: {}
    }
  },
  {
    relationshipWeightProperty: null
  }
)
YIELD
  graphName,
  nodeProjection,
  nodeCount,
  relationshipProjection,
  relationshipCount,
  projectMillis;
