//Degrees
CALL gds.graph.project(
    'Degrees', 
    '*',      
    {
    relType: {
      type: '*',
      orientation: 'UNDIRECTED',
      properties: {}
    }
    }, 
    {});

CALL gds.degree.write(
    'Degrees', 
    {
    relationshipWeightProperty: null,
    writeProperty: 'degree'
    }
);