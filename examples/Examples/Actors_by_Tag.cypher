//Actors by Tag
MATCH (va:VoiceActor)-[:VOICED_BY]-(anime:Anime)
WHERE 'Action' IN anime.Tags
WITH va, COUNT(anime) AS broj
RETURN va, broj
ORDER BY broj DESC;