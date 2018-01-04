#Analise de Agrupamento

#Metodo hierarquico

#AGNES:

#PAcotes necessarios para o exemplo:
library(stats)

#Carregando dados que serao utilizados no exemplo:
consumo = read.csv(choose.files(), header=T, sep=";")
consumo
#dados normalizados:
consumonorm =  read.csv(choose.files(), header=T, sep=";")
consumonorm

#Contruindo a matrix de similaridade:
ms=dist(consumonorm[,2:4], method="euclidean");ms


# Implementando o agrupamento hierarquico aglometativo: 
agrupamento = hclust(ms,                # matrix de similaridade
                     method="single")   # qual abordagem a ser utilizada para calcular a distancia entre grupos, pode ser: (menor distancia "single")(maior distancia "complete")(distancia media "average")
agrupamento

#A visualizacao do reultado de agrupamento por meio de dendogramas:
plot(agrupamento, main="Agrupamento Hierarquico Aglomerativo", xlab="Clientes", ylab="Distancia")


#Para representar os grupos no dendograma:

#Implementa a representacao de grupos do dendograma - considerando a geracao de vetores:
grupos = cutree(agrupamento,            #variavel resultante da aplicacao da funcao hclust()
                k=2)                    #numero inteiro que representa a quantidade de segmentos (grupos) desejados
grupos

#Implementa a representacao de grupos no dendograma - conseiderando cortes no dendograma:
rect.hclust(agrupamento,                #variavel resultante da aplicacao da funcao hclust()
            k=2,                        #numero inteiro que representa a quantidade de segmentos (grupos) desejados
            border="red")               #a cor da linha desenhada na visualizacao do dendograma


