import pandas as pd

# Read the CSV file containing user scores for top 1000 anime
df_user_scores_top_1000 = pd.read_csv('user_scores_for_top_1000_anime.csv')

# Read the CSV file containing user details
df_user_details = pd.read_csv('users-details-2023.csv')

# Merge the two dataframes based on 'Username'
merged_users_df = pd.merge(df_user_details, df_user_scores_top_1000[['Username']], on='Username', how='inner')

merged_users_df = merged_users_df.drop_duplicates(subset='Mal ID')

# Save the result to a new CSV file
merged_users_df.to_csv('users_with_scores_for_top_1000_anime.csv', index=False)

