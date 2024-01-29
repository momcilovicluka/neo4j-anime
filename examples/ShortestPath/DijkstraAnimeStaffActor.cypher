//DijkstraAnimeStaffActor
CALL db.propertyKeys() YIELD propertyKey MATCH (start) WHERE start[propertyKey] contains 'Kaguya-sama'
WITH start
LIMIT 1
CALL db.propertyKeys() YIELD propertyKey MATCH (end) WHERE end[propertyKey] contains 'Tomohiro Kishi'
WITH start, end
LIMIT 1
WITH $config AS config, start, end
WITH config { .*, sourceNode: id(start), targetNode: id(end)} as config
CALL gds.shortestPath.dijkstra.stream('AnimeStaffVoiceActor', config)
YIELD nodeIds, costs
UNWIND range(0, size(nodeIds)-1) AS index
RETURN gds.util.asNode(nodeIds[index]) AS node, costs[index] AS cost;