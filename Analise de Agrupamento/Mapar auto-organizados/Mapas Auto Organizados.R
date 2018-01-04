#Analise de Agrupamento

#Mapas auto-organizaveis

#SOM:

#PAcotes necessarios para o exemplo:
library(kohonen)

#Carregando dados que serao utilizados no exemplo:
vendas = read.csv(choose.files(), header=T, sep=";");vendas

vendasnorm = read.csv(choose.files(), header=T, sep=";");vendasnorm

#Aplicacao da funcao que implementa SOM:
som_model = som(vendas,                                 #conjunto de dados analisado pelo SOM, disponivel em um formato de matriz em que cada linha representa um exemplar
                grid=somgrid(2,2,"rectangular"),        #Objeto com a dimensao do mapa e seu lattice (rectangular ou hexagonal)
                rlen=100,                               #Epoca: Eh o numero de vezes que o conjunto completo de dados eh apresentado a rede
                alpha=c(0.05,0.01))                     #Taxa de aprendizado: Eh um vetor de dois numeros indicando o valor inicial para a taxa e o valor final
som_model                                               #retorna um objeto com os valores dos parametros da arquitetura do SOM, incluindo pesos dos neuronios ajustados e tambem os dados de treinamento


#Para a plotagem do SOM:
plot(som_model, type="changes")                         #Progresso do Treinamento
plot(som_model, type="counts")                          #grafico de contagem
plot(som_model, type="codes")                           
