//Load Anime data
LOAD CSV WITH HEADERS FROM 'file:///merged_top_1000_anime.csv' AS row

// Replace null values with default values
WITH row,
  coalesce(row.End_year, 0) AS endYear,
  coalesce(row.Episodes, 0) AS episodes,
  coalesce(row.Content_Warning, 'No Content Warning') AS contentWarning,
  coalesce(row.Release_season, 'Unknown') AS releaseSeason,
  coalesce(row.Related_Mange, 'No Related Manga') AS relatedMange,
  coalesce(row.Related_anime, 'No Related Anime') AS relatedAnime

// Create Anime nodes
MERGE (a:Anime {
AnimeID: toInteger(row.anime_id),
  Name: coalesce(row.Name, 'Unknown Anime'),
  Score: toFloat(row.Score),
  Genres: split(coalesce(row.Genres, ''), ', '),
  Synopsis: coalesce(row.Synopsis, 'No Synopsis'),
  Type: coalesce(row.Type, 'Unknown Type'),
  Aired: coalesce(row.Aired, 'Unknown Airing'),
  Premiered: coalesce(row.Premiered, 'Unknown Premiere'),
  Status: coalesce(row.Status, 'Unknown Status'),
  Source: coalesce(row.Source, 'Unknown Source'),
  Rating:  coalesce(row.Rating, 'Unknown Rating'),
  Popularity: toInteger(coalesce(row.Popularity, 0)),
  Favorites: toInteger(coalesce(row.Favorites, 0)),
  Members: toInteger(coalesce(row.Members, 0)),
  Image: coalesce(row.Image, 'No Image'),
  ReleaseSeason: releaseSeason,
  Tags: split(coalesce(row.Tags, ''), ', '),
  ReleaseYear: toInteger(coalesce(row.Release_year, 0)),
  EndYear: toInteger(endYear),
  ContentWarning: contentWarning,
  RelatedManga: relatedMange,
  Staff: split(coalesce(row.staff, ''), ', '),
  RelatedAnime: split(relatedAnime, ', ')
})

// Extract and create Producer entities
FOREACH (producerRaw IN split(coalesce(row.Producers, ''), ',') |
  MERGE (p:Producer {Name: TRIM(producerRaw)})
  MERGE (a)-[:PRODUCED_BY]->(p)
)

// Extract and create Licensor entities
FOREACH (licensorRaw IN split(coalesce(row.Licensors, ''), ',') |
  MERGE (l:Licensor {Name: TRIM(licensorRaw)})
  MERGE (a)-[:LICENSED_BY]->(l)
)

// Extract and create Studio entities
FOREACH (studioRaw IN split(coalesce(row.Studios, ''), ',') |
  MERGE (s:Studio {Name: TRIM(studioRaw)})
  MERGE (a)-[:CREATED_BY]->(s)
)

// Create Voice Actor nodes and relationships
FOREACH (vaRaw IN split(coalesce(row.Voice_actors, ''), ', ') |
  FOREACH (ignoreMe IN CASE WHEN vaRaw CONTAINS ' : ' THEN [1] ELSE [] END |
    MERGE (actor:VoiceActor {Name: trim(split(vaRaw, ' : ')[1])})
    MERGE (a)-[:VOICED_BY {character: split(vaRaw, ' : ')[0]}]->(actor)
  )
)

// Create Staff nodes and relationships with specific roles
FOREACH (staff IN split(coalesce(row.staff, ''), ', ') |
  FOREACH (ignoreMe IN CASE WHEN NOT staff CONTAINS ' : ' THEN [1] ELSE [] END |
    MERGE (s:Staff {Name: staff})
  )
  FOREACH (ignoreMe IN CASE WHEN staff CONTAINS ' : ' THEN [1] ELSE [] END |
    MERGE (s:Staff {Name: split(staff, ' : ')[0]})
    MERGE (a)-[:WORKED_AS {role: split(staff, ' : ')[1]}]->(s)
  )
)

// Create Related Anime relationships
FOREACH (relatedAnime IN split(relatedAnime, ', ') |
  MERGE (related:Anime {Name: relatedAnime})
  MERGE (a)-[:RELATED_TO]->(related)
)