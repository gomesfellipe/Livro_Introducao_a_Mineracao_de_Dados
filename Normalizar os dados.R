#Funcao parar normalizar os dados min-max [ normminmax() ]:
normminmax=function(dados){
for(i in 1:length(dados)){
dados[i]=(dados[i]-min(dados))/(max(dados)-min(dados))
};dados
}

#Funcao parar normalizar os dados z-scrore [ normz() ]:
normz=function(dados){
  for(i in 1:length(dados)){
    dados[i]=(dados[i]-mean(dados))/(sd(dados))
  };dados
}

normz()

