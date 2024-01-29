//Load User Scores
LOAD CSV WITH HEADERS FROM 'file:///user_scores_for_top_1000_anime.csv' AS ratingRow

MATCH (u:User {Username: ratingRow.Username})
MATCH (a:Anime {AnimeID: toInteger(ratingRow.anime_id)})

CREATE (u)-[:RATED {score: toInteger(ratingRow.rating)}]->(a)