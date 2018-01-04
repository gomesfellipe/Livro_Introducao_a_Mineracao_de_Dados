#Redes Neurais:

#Pacotes que serao utilizados:
library("RSNNS")

#Conjunto de dados que sera utilizado:
d=read.csv(choose.files(), sep=";", header=T)
d

#Criando a variavel com exemplares do conjunto treinamento:
X=d[,2:3]
#Criando a variavel de rotulos dos exemplares do conjunto de dados:
Y=decodeClassLabels(d[,4])

#Entao, conjuntos de treinamento e teste devem ser criados,
#Para tanto, a funcao slitForTraininAndTest() recebe como parametros:
d_separado=splitForTrainingAndTest(X,                  #A variavel com os exemplares,
                                   Y,                  #A variavel com os rotulos e
                                   ratio=0.1           #A proporcao do conjunto de dados que deve compor o conjunto de teste
                                   );d_separado

#Comando para normalizar os dados:
d_normalizado=normTrainingAndTestSet(d_separado, dontNormTargets = TRUE, type="0_1");d_normalizado

str(d_normalizado)
str(d_separado)
#Como foi preciso normalizar os dados:
d_separado=d_normalizado

#Para criar o modelo:
modelo_mlp = mlp(d_separado$inputsTrain,               #Exemplares do conjunto Treinamento
                 d_separado$targetsTrain,              #Rotulos dos exemplares do conjunto de treinamento
                 size=c(3),                            #Numero de neuronios na camada escondida. Pode ser vetor para o caso de mais de uma camada escondida.O valor numérico e escalar define o numero de neuronios na camada escondida
                 maxit=5000,                           #Numero maximo de iteracoes (epocas)
                 initFunc = "Randomize_Weights",       #Define como os pesos devem ser inicializados(Opcoes: "Randomize_Weights" ou a definicao de um vetor de valores desejados para a inicializacao)
                 learnFunc = "Std_Backpropagation",    #Estabelece o algoritmo de aprendizado (Opcoes: "Std_Backpropagation"; "BackpropBatch"; "Quickprop")
                 learnFuncParams = c(0.1),             #Valor para a taxa de aprendizado
                 hiddenActFunc = "Act_Logistic",       #Define o tipo de funcao de ativacao do neuronios da camada escondida (Act_Logistic)
                 shufflePatterns = TRUE,               #PArametro para definir se os exemplares do conjunto de treinamento devem ou nao ser embaralhados para cada epoca
                 linOut=TRUE,                          #Define qual deve ser a funcao de ativacao para os neuronios da camada de saida, linear ou logistica (Opcoes: TRUE para linear ou FALSE para logistica)
                 inputsTest = d_separado$inputsTest,   #Refere-se aos padroes separados para teste da rede
                 targetsTest = d_separado$targetsTest  #Refere-se as saidas desejadas dos padroes de teste, usados apenas para aferir o desempenho da predicao
                 );modelo_mlp

#Para plotar a curva de aprendizado, precisamos do erro medio quadrado de cada iteracao para o conjunto treinamento e para o conjunto teste, IterativeFitError e IterativeTestError respectivamente:
plot(modelo_mlp$IterativeFitError, 
     type="n",
     main="Curva de Aprendizagem",
     xlab="Iteracao",
     ylab="Erro medio quadrado",
     cex.lab=1.5,
     ylim=c(0,10)
     )
lines(modelo_mlp$IterativeFitError, col="1", lwd=3, cex=2)
lines(modelo_mlp$IterativeTestError, col="2", lwd=3)
