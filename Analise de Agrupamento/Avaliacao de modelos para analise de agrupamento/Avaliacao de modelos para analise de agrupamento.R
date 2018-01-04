#Avaliacao de modelos para analise de agrupamento

#Pacotes que serao utilizados nos exemplos:
library(stats)
library(fpc)
library(clv)

#Primeiramente, o conjunto de dados que sera utilizado para a analise:

#Alta compacidade e alta separabilidade
x1 = rbind(matrix(rnorm(300,2,0.2),ncol=2),matrix(rnorm(300, 0.5, 0.2), ncol=2));x1

#Vejamos:
plot(x1, type="n", xlab="x_i1", ylab="x_i2", cex.lab=1.5, cex.axis=2.5)
points(x1[1:150,1],x1[1:150,2],col="4", lwd=3.5,cex=3.5,pch=22)
points(x1[151:300,1],x1[151:300,2],col="2", lwd=3.5,cex=3.5,pch=21)
label=as.integer(c(rep(1,150), rep(2,150)))

#Baixa compacidade:
#Conjunto de dados disponivel em http://cs.joensuu.fi/sipu/datasets/
x2=read.csv(choose.files(), sep="\t", header=F)
x2=as.matrix(x2)
x2=cbind(x1[,1], x2[,2])

#Vejamos:
plot(x2, type="n", xlab="x_i1", ylab="x_i2", cex.lab=1.5, cex.axis=2.5)
points(x2[1:97,1],x2[1:97,2],col="2", lwd=3.5,cex=3.5,pch=21)
points(x2[98:373,1],x2[98:373,2],col="2", lwd=3.5,cex=3.5,pch=22)

#Alta compacidade e baixa separabilidade
x3 = rbind(matrix(rnorm(300,0,sd=0.4),ncol=2),matrix(rnorm(300, 1, 0.4), ncol=2));x3

#Vejamos:
plot(x3, type="n", xlab="x_i1", ylab="x_i2", cex.lab=1.5, cex.axis=2.5)
points(x1[1:150,1],x1[1:150,2],col="2", lwd=3.5,cex=3.5,pch=21)
points(x1[151:300,1],x1[151:300,2],col="4", lwd=3.5,cex=3.5,pch=22)
label=as.integer(c(rep(1,150), rep(2,150)))

#Agora os conjuntos de dados sera submetidos a um processo de agrupamento de dados pelo k-medias,
#como ja se sabe previamente o numero de grupos, o parametro k foi definido como 2:
grupos=kmeans(x1,2)
plot(x1, type="n", xlab="x_i1", ylab="x_i2", cex.lab=1.5, cex.axis=2.5)
#Vejamos a distribuicao dos dados de forma grafica:
G1=x1[(grupos$cluster==1), 1:2]
points(G1[,1], G1[,2], col="4", lwd=3.5, cex=3.5, pch=22)
G2=x1[(grupos$cluster==2), 1:2]
points(G2[,1], G2[,2], col="2", lwd=3.5, cex=3.5, pch=21)
#Vejamos o comportamento de seus centroides
C1=grupos$centers[1,]
points(C1[1], C1[2], col="1", lwd=4, cex=4, pch=15)
C2=grupos$centers[2,]
points(C2[1], C2[2], col="1", lwd=4, cex=4, pch=16)




# calculo dos indices -----------------------------------------------------

#Aplicando a funcao que calcula os indices externos:

#dados de exemplo:
G = as.integer(c(1,1,1,1,2,2,2))
P = as.integer(c(1,1,1,2,1,2,2))

std=std.ext(P,                                          #Eh o conjundo de rotulos dos dados, representando o particionamento conhecido
            G)                                          #Eh o conjunto de rotulos associado aos dados por um algoritmo de agrupamento de dados
std                                                     #funcao retorna um objeto com as variaveis Soma A, Soma B, Soma C, Soma D

#Portanto, os indices de validacao externos podem ser obtidos da seguinte maneira:
rand = clv.Rand(std);rand
jaccard = clv.Jaccard(std);jaccard
folk.mal = clv.Folkes.Mallows(std);folk.mal

#Aplicacao da funcao que calcula os indices internos:

#dados de exemplo:
x= c(3,7,10,17,18,20)
G=kmeans(x,3)
grupos = as.integer(G$cluster)

scatt = cls.scatt.data(as.matrix(x),                    #Eh o conjunto de dados submetido ao agrupamento       
                       grupos,                          #Eh o conjunto de rotulos associado aos dados por um algoritmo de agrupamento
                       dist="euclidean")                #Eh a metrica de distancia para o calculo de similaridade inter e intragrupos, por exemplo: euclidean, manhattan, correlation
scatt                                                   #Funcao retorna um objeto com medidas inter e intragrupos

#Apos calculadas as medidas inter e intragupos, eh possivel calcular os indices a partir dos seguintes comados:
devier = clv.Davies.Bouldin(scatt, "complete", "single");devier
dunn = clv.Dunn(scatt, "complete", "single"); dunn

#Note que ha dois tipos de parametros que devem ser previamente definidos: intercluster e intracluster.
#Para intercluster: principais discutidas no agrupamento hierarquico: single, complete, average e centroid
#PAra intracluster: opcoes sao : complete, average, controid
#Nos exemplos acima foi utilizado a opcao centroide para os dois casos


#O indice Silhouette:
indices = cluster.stats(dist(x),                        #Eh a matriz de distancia entre os dados
                        grupos)                         #Eh o conjunto de rotulos associado aos dados por um algoritmo de agrupamento de dados.
indices                                                 #Retorna um objeto com varios valores de indices, entre eles o valor do Indice de Silhouette
#e finalmente;
silhouette = indices$avg.silwidth ; silhouette
