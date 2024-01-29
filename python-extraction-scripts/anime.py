import pandas as pd

# Read the CSV file
df = pd.read_csv('anime-dataset-2023.csv')

# Exclude rows where 'Score' is UNKNOWN
df = df[df['Score'] != 'UNKNOWN']

# Convert the 'Score' column to numeric for sorting
df['Score'] = pd.to_numeric(df['Score'])

# Sort by 'Score' in descending order
df_sorted = df.sort_values(by='Score', ascending=False)

# Select the top 1000 rows
df_top_1000 = df_sorted.head(1000)

# Save the result to a new CSV file
df_top_1000.to_csv('top_1000_anime.csv', index=False)
