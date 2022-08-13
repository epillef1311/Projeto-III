import numpy as np
import pandas as pd



planilha_original = pd.read_csv(r"C:\Users\joana\Downloads\movies.csv").to_numpy()

col = np.ma.size(planilha_original, 1)
lin = np.ma.size(planilha_original, 0)

caminho = r"C:\Users\joana\Downloads\english_movies.csv"
exporta = []
print("aqui")
for i in range(lin):
    print("***")
    if planilha_original[i][3] == 'en':
        print(planilha_original[i])
        exporta.append(planilha_original[i])

novo = pd.DataFrame(exporta)  # convertendo a matriz em dataframe para exportação
novo.to_csv(caminho, index=False, sep=',',
                    header=['ID', 'TITLE', 'GENRES', 'ORIGINAL_LANGUAGE','OVERVIEW','POPULARITY',
                            'PRODUCTION_COMPANIES', 'RELEASE_DATE', 'BUDGET', 'REVENUE', 'RUNTIME',
                            'STATUS', 'TAGLINE','VOTE_AVERAGE','VOTE_COUNT','CREDITS', 'KEYWORDS', 'POSTER_PATH',
                            'BACKDROP_PATH', 'RECOMMENDATIONS'])




