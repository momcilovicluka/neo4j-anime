//Ratings PageRank
CALL gds.pageRank.stream('Ratings') YIELD nodeId, score
RETURN gds.util.asNode(nodeId).Username AS name, nodeId, score
ORDER BY score DESC LIMIT 10