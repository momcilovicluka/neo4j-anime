//Ratings projection
CALL gds.graph.project.cypher('Ratings',
  'MATCH (n) WHERE n:Anime OR n:User RETURN id(n) AS id, labels(n) AS labels',
  'MATCH (a:Anime)-[r:RATED]-(u:User) RETURN id(a) AS source, id(u) AS target, r.weight AS weight'
);