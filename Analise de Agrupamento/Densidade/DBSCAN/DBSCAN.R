#Analise de Agrupamento

#Agrupamento por densidade

#DBSCAN:

#PAcotes necessarios para o exemplo:
library(fpc)

#Carregando dados que serao utilizados no exemplo:
vendas = read.csv(choose.files(), header=T, sep=";");vendas

vendasnorm = read.csv(choose.files(), header=T, sep=";");vendasnorm

#Implementando o algoritmo DBSCAN:
dbs = dbscan(vendasnorm,         #o conjundo de dados agrupados, disponivel como um data.frame
             eps=1,              #eh o parametro que determina a vizinhanca acessivel de um exemplar - nomeado como eps
             MinPts=2)           #eh o parametro exigido na verificacao da densidade de vizinhanca de um exemplar
dbs                              #retorna um objeto com os grupos descobertos e tambem indicacao de exemplares classificados como ruido

#Para ver os indicadores de grupos para cada exemplar do conjunto de dados, sendo 0 significa que o exemplar foi considerado ruído
dbs$cluster

#Para visualizar os resultados, eh possivel gerar uma plotagem:
plot(dbs, vendasnorm)
