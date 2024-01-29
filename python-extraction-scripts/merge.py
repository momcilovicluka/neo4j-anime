
import pandas as pd

# Read the CSV file containing the top 1000 anime
df_top_1000_anime = pd.read_csv('top_1000_anime.csv')

# Read the CSV file containing additional anime information
df_additional_info = pd.read_csv('Anime.csv')

# Merge the two dataframes based on 'Name'
merged_anime_df = pd.merge(df_top_1000_anime, df_additional_info[['Name', 'Release_season', 'Tags', 'Release_year', 'End_year', 'Content_Warning', 'Related_Mange', 'Related_anime', 'Voice_actors', 'staff']], on='Name', how='left', suffixes=('_top', '_additional'))

# Save the result to a new CSV file
merged_anime_df.to_csv('merged_top_1000_anime.csv', index=False)
