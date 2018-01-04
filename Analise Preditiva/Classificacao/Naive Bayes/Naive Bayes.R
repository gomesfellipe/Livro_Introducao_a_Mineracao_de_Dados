#Naive Bayes

#Pacotes utilizados:
library(e1071)

#Importando o bando de dados que sera utilizado no exemplo:
planejamento=read.csv(choose.files(), header=T, sep=";")
planejamento

#Contruindo o classificador:
modelo_NB = naiveBayes(planejamento[,1:4],    #Eh um data.frame ou matriz contendo os exemplares de treinamento
                       planejamento[,5],      #Eh o vetor com as classes para cada exemplar do conjunto de treinamento
                       0                      #Eh um numero real positivo que controla a suavezacao de Laplace. O default eh zero, desabilitando-a
                       )

#Criando um objetivo para teste:
exemplar_teste=data.frame(previsao="sol", temperatura="frio", humidade="normal", vento="sim")

#Fazendo uma predicao com o Naive Bayes:
y_estimado = predict(modelo_NB,               #Eh o modelo contruido pela funcao naiveBayes()
                     exemplar_teste,          #Eh o exemplo de teste
                     type="class",            #Eh o parametro com dois valores possiveis: "class" se o resultado eh apresentado apenas pela classe de maior probabilidade ou "raw" pela probabilidade de cada classe
                     0)                       #Eh um numero real positivo que controla a suavezacao de Laplace. O default eh zero, desabilitando-a
y_estimado

#Se a opcao de classificacao fosse por apresentar a probabilidade (raw), o resultado seria:
y_estimado = predict(modelo_NB,               #Eh o modelo contruido pela funcao naiveBayes()
                     exemplar_teste,          #Eh o exemplo de teste
                     type="raw",              #Eh o parametro com dois valores possiveis: "class" se o resultado eh apresentado apenas pela classe de maior probabilidade ou "raw" pela probabilidade de cada classe
                     0)                       #Eh um numero real positivo que controla a suavezacao de Laplace. O default eh zero, desabilitando-a
y_estimado
