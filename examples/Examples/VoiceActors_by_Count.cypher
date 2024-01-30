//VoiceActors by Count
MATCH (va:VoiceActor)-[v:VOICED_BY]-(a:Anime)
WITH va, COUNT(*) AS noVoiced
RETURN va, noVoiced
ORDER BY noVoiced DESC;