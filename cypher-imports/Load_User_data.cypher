//Load User data
LOAD CSV WITH HEADERS FROM 'file:///users_with_scores_for_top_1000_anime.csv' AS row
CREATE (u:User {
  MalID: toInteger(row.`Mal ID`),
  Username: row.Username,
  Gender: row.Gender,
  Birthday: date(datetime(row.Birthday)).year + '-' + date(datetime(row.Birthday)).month + '-' + date(datetime(row.Birthday)).day,
  Location: row.Location,
  Joined: date(datetime(row.Joined)).year + '-' + date(datetime(row.Joined)).month + '-' + date(datetime(row.Joined)).day,
  DaysWatched: toFloat(row.`Days Watched`),
  MeanScore: toFloat(row.`Mean Score`),
  Watching: toInteger(row.Watching),
  Completed: toInteger(row.Completed),
  OnHold: toInteger(row.`On Hold`),
  Dropped: toInteger(row.Dropped),
  PlanToWatch: toInteger(row.`Plan to Watch`),
  TotalEntries: toInteger(row.`Total Entries`),
  Rewatched: toFloat(row.Rewatched),
  EpisodesWatched: toInteger(row.`Episodes Watched`)
})
