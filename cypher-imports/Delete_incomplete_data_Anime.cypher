//Delete incomplete data Anime
MATCH (a:Anime)
WHERE NOT EXISTS(a.AnimeID)
DELETE a