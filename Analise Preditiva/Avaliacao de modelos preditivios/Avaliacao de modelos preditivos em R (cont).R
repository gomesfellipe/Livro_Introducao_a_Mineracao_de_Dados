#Avaliacao de modelos preditivos em R

#PAcotes que serao utilizados:
library(cvTools) #PAra gerar metodologia de validacao cruzada sob variacao leave-one-out ou k-fold

#COnjutno de dados que sera utilizado:
satisfacao = read.csv(choose.files(), sep=";", header= T)

#COnstruindo os conjuntos (folds) para validacao cruzada

N= 12
K=4
tipo = "random"


folds = cvFolds(N,  #numero de exemplares disponiveis no conjunto de dados
                4,  #Quantidade de subconjuntos (folds) que se deseja gerar
                type="random" #Eh o metodo que pode ser usado para executar a distribuicao dos exemplares nos subconjuntos : consecutive, random (default) e interleaved
                )
folds
