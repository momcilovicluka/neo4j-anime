//Path between Animes
MATCH path = (a:Anime)-[:CREATED_BY|LICENSED_BY|PRODUCED_BY|RELATED_TO*1..2]-(a2:Anime)
WHERE a.Name CONTAINS 'Kaguya-sama' AND a2.Name CONTAINS 'Fate'
Return path LIMIT 25