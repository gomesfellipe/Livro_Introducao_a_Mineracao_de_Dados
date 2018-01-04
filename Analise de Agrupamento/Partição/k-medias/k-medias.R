#Analise de Agrupamento

#Agrupamento por particao

#k-medias:

#PAcotes necessarios para o exemplo:
library(stats)

#Carregando dados que serao utilizados no exemplo:
atendimento = read.csv(choose.files(), header=T, sep=";");atendimento

#Para implementar o algoritmo k-medias:
perfils = kmeans(atendimento[2:3],           #data.frame contendo dados numericos para serem submetidos ao processo de agrupamento
                2,                     #numero que indica o numero de grupos a ser descoberto
                iter.max=5)            #eh o numero maximo de iteracoes permitido no algoritmo
perfils

#O numero de exemplares associados a cada grupo:
perfils$size

#Os centroides finais na forma de uma matriz de medias dos exemplares associados a cada grupo:
perfils$centers

#O indice do grupo ao qual cada exemplar foi associado:
perfils$cluster

