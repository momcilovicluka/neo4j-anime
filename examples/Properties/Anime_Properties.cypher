//Anime Properties
MATCH (a:Anime) WITH DISTINCT keys(a) AS keys
UNWIND keys AS keyslisting WITH DISTINCT keyslisting AS allfields
RETURN allfields;