#Arvores de Decisao

#PAcotes que sera utilizados:
library(rpart)
library(rpart.plot)

#Importando os dados que serao utilizados no exemplo:
dados=read.csv(choose.files(), header=T,sep=";" ) #abrirconjunto de dados chamado "qualidade"
fix(dados)
str(dados)

#Construindo uma arvore de decisao:

modelo_ad=rpart(R ~EP + QR + LE,                    #Formula que define qual eh o argumento classe e quais sao os atributos
             data=dados,                            #Eh o conjunto de dados armazenado em um data.frame
             method="class",                        #Eh o parametro que define se a arvore sera usada como classificacao ("class") ou regressao ("anova")
             control=rpart.control(minsplit=1),     #Eh a variavel na qual sao armazenados os parametros que controlam o crescimento da arvore
             parms=list(split="Information")        #Eh a variavel na qual eh definido o criterio de selecao de atributos
             )

#Usando uma arvore de decisao:

y_estimado=predict(modelo_ad,                       #Eh o resultado da construcao da arvore de decisao
                   dados[2,1:3],                    #Eh a variavel que contem os atributos descritivos dos exemplares de teste, considerando os mesmos atributos descritivos usados na geracao de modelo_ad
                   "class")                         #Especifica como sera apresentado o resultado da predicao: um vetor para valores numericos ("vector"), classe para valores categoricos ("class"), ou a probabilidade de cada classe ("prob")
y_estimado

#Visualizando uma arvore de decisao:

plot=rpart.plot(modelo_ad,                          #Eh o resultado da contrucao da arvore de decisao
                2,                                  #Eh a quantidade de casas decimais
                2)                                  #Especifica como sera apresentado o resultado da visualizacao, pode assumiar valores de 0 a 4