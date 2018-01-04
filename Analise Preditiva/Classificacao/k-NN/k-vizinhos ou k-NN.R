#k-vizinhos mais proximos ou k-NN
#

#Exemplo pratico para k-NN :

#Pacotes que serao utilizados:
library(class)

#Conjunto de dados que sera utilizado:
head(iris)
str(iris)

#Contem dados numericos com atributos descritivos usados como conjunto de treinamento
treinamento=iris[2:150, 1:4]
#Contem dados numericos com atributos descritivos para a realizacao do teste
rotulos=iris[2:150,5]
#Utilizado para testar nosso modelo:
teste=iris[1,1:4]
#O numero de vizinhos mais proximos a serem consultados
k=3

#Finalmente, o uso da funcao knn():
y_estimado =knn(treinamento, teste, rotulos, k);y_estimado


#Outra maneira, dessa vez selecionando uma amostra:


#Contem dados numericos com atributos descritivos usados como conjunto de treinamento
treinamento=iris[seq(1,150,2), 1:4]
#Contem dados numericos com atributos descritivos para a realizacao do teste
rotulos=iris[seq(1,150,2),5]
#Utilizado para testar nosso modelo:
teste=iris[seq(2,150,2),1:4]
#O numero de vizinhos mais proximos a serem consultados
k=3

#Finalmente, o uso da funcao knn():
y_estimado =knn(treinamento, teste, rotulos, k);y_estimado

#Taxa de acerto:

tx=sum(y_estimado==iris[seq(2,150,2),5])/length(seq(2,150,2));tx

