//Related PageRank
CALL gds.pageRank.stream('RelatedAnime', {}) YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS node, score
RETURN node, score
ORDER BY score DESC
LIMIT toInteger(10);