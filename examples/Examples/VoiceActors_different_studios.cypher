//VoiceActors different studios
MATCH (va:VoiceActor)-[v:VOICED_BY]-(a:Anime)-[c:CREATED_BY]-(s:Studio)
WITH va, COUNT(distinct s) AS cnt
RETURN va, cnt
ORDER BY cnt DESC