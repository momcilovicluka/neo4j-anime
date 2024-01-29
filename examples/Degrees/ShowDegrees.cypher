//ShowDegrees
MATCH (node)
WHERE node.degree IS NOT NULL
RETURN node, node.degree AS score
ORDER BY score DESC
LIMIT toInteger(50);