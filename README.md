# neo4j-anime
![GitHub Repo stars](https://img.shields.io/github/stars/momcilovicluka/neo4j-anime?style=for-the-badge&color=0000ff) 
![GitHub last commit](https://img.shields.io/github/last-commit/momcilovicluka/neo4j-anime?style=for-the-badge&color=0000ff) 
![GitHub repo size](https://img.shields.io/github/repo-size/momcilovicluka/neo4j-anime?style=for-the-badge&color=0000ff)

Repo for faculty project about NoSQL databases, specifically Neo4j

- 📄Source data is from kaggle: [dbdmobile/myanimelist-dataset](https://www.kaggle.com/datasets/dbdmobile/myanimelist-dataset)
	- anime-dataset-2023.csv: Base source for anime info
	- users-details-2023.csv: Info about users that rated anime
	- users-score-2023.csv: User scores for anime

- ➕Additional info about anime (voice actors and staff memebers): [vishalmane10/anime-dataset-2022](https://www.kaggle.com/datasets/vishalmane10/anime-dataset-2022)

## Project Structure 📐
- **[Neo4j import](/cypher-imports)**: Cypher querries for importing data from csv 📃
- **[Extracted CSV](/extracted-csv)**: Extracted CSV files used for importing with cypher 🗃
- **[Python scripts](/python-extraction-scripts)**: Python scripts extract necessary data from source kaggle CSVs 🛠
- **[Example querries](/examples)**: Example querries to get some interesting insight from graph database🖨️