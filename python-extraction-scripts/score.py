import pandas as pd

# Read the CSV file containing the top 1000 anime
df_top_1000_anime = pd.read_csv('top_1000_anime.csv')

# Read the CSV file containing user scores
df_user_scores = pd.read_csv('users-score-2023.csv')

# remove all scores where userid is more than 1000
df_user_scores = df_user_scores[df_user_scores['user_id'] <= 1000]

# Merge the two dataframes based on 'anime_id'
merged_df = pd.merge(df_user_scores, df_top_1000_anime[['anime_id']], on='anime_id', how='inner')

# Save the result to a new CSV file
merged_df.to_csv('user_scores_for_top_1000_anime.csv', index=False)

