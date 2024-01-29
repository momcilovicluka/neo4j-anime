//Related LabelPropagation Community
CALL gds.labelPropagation.stream('RelatedAnime') YIELD nodeId, communityId
WITH gds.util.asNode(nodeId) AS node, communityId
RETURN node, communityId
ORDER BY communityId, node.name
LIMIT toInteger(10);
