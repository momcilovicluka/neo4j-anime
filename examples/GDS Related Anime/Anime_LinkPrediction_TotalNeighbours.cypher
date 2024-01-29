//Anime LinkPrediction TotalNeighbours
MATCH (a1:Anime)
WHERE a1.Name CONTAINS 'Conan'
MATCH (a2:Anime)
WHERE a2.Name CONTAINS 'Lupin'
RETURN gds.alpha.linkprediction.totalNeighbors(a1, a2, {relationshipQuery: 'RELATED_TO'}) AS score, a1.Name, a2.Name
ORDER BY score DESC