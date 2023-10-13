#Instalar pacotes
#exemplo= instalar o tidyverse
install.packages('tidyverse', dep = T)
# a sintaxe é:
#   install.packages('nome_do_pacote', dep = T)
#      'nome_do_pacote' - o nome do pacote entre aspas simples '' ou aspas duplas "" 
#       dep = T  - muitos pacotes dependem de outros pacotes para funcionar,
#        ao  definir dependência (dep) verdadeiro (T de TRUE), é garantido que tudo que seja necessário para o
#       funcionamento seja instalado

#Carregar pacotes instalados

library(tidyverse)
library(ggthemes)
#a sintaxe é librady(nome_do_pacote), SEM ASPAS


#Variavel

#O R é uma linguagem vetorial e matricial. Um numero é um vetor de uma unica posição.
#Para criar um vetor usa-se a função c()
#Exemplo:
a <- c(2) 
# "a" agora é um vetor de tamanho 1, com o valor "2". A partir de agora, quando chamar "a" será puxado o valor "2"
a #deem ctrl enter e no console aparecerá "2"

#Tipos de váriavel

#Os tipos de variavel são:
#integer - Numero inteiro
#double - Numero real
#complex - numero complexo
#logical -variaveis lógicas que seguem algebra booleana e valores são apenas True/False (Verdadeiro/Falso) 
#character - Texto simples
#A função que identifica o tipo de variavél é:
#typeof()
#Pode-se transformar um tipo de variavel em outro com as funções "as.tipo_desejado".
#Exemplos:
as.integer()
as.double()
as.complex()
as.logical()
as.character()
#Essas funções não 100% eficientes e podem dar bugs.
#Geralmente a informação do tipo não é de grande relevância, sendo as classes o que mais impacta no funcionamento de funções.

#As classes de variavel mais comuns do R são:
#       - Numeric - numérico comum que engloba os tipos:
#           - Inteiro - integer
#           - Real - double
#           - Complexo -  complex
#    
#       - Character - Texto simples 
#       - Logical - do tipo logical
#       - Date -  datas dos variados formatos.
#       -Data.frame - em desuso, evitar esse formato

#Exemplos

b<-c("oi")
class(a)

c<-c(TRUE)
class(c)

d<- c("1")
class(d)

#as funções as_algumacoisa também funcionam para as classes 
e<-as.numeric(d)
e
class(e)
typeof(e)


#Definindo variaveis, vetores, matrizes, listas e tabelas

#Já foi apresentado aqui como definir vetors usando o comando "c()".
# a sintaxe do mesmo é:
# nome_do_vetor <-c(a,b,c), em que
#       - nome_do_vetor -  a sua escolha;
#       -  "<-" é utilizado para atribuição. O "=" também funciona, mas deve ser evitado;
#       - c(a,b,c) -  os itens do vetor são separados por virgulas e podem ser de qualquer classe/tipo, 
#                     contanto que TODOS os itens sejam da mesma classe

#Alguns exemplos de vetores:
nomes<- c("Bruna","Wallace","Matheus") #vetor de caracter
nomes
class(nomes)

numeros<-c(1,2,3)  #vetor numerico
numeros
class(numeros)

#pode-se criar um vetor de contagem usando o i:j
cont1<- c(1:3)
cont1

cont2<- c(2:8)
cont2

cont3 <-(10:1)
cont3 



vazio<-c() #vetor vazio
vazio
class(vazio)

# O vetor vazio é muito util na criação de uma variavel que no futuro será atribuida por alguma função/comando
#Exemplo:
vazio
vazio <- nomes
vazio #agora "vazio" é igual a "nomes"
#para "zerar" a variavel pode-se novamente utilizar c()
vazio<- c()
vazio
#vamos usar uma função que retorna a média do vetor "numeros" e colocar esse resultado em vazio
vazio<- mean(numeros) #essa função será utilizada novamente no futuro


#Matrizes

#Para criar uma matriz é a seguinte sintaxe:
  matrix(data, nrow = 1, ncol = 1, byrow = FALSE)
  #onde:
#     data é os dados a serem preenchidos na matriz. Para criar uma matriz "vazia", usa-se NA
#     "nrow =" numero de linhas
#     "ncol =" numero de colunas
#     "byrow = FALSE/TRUE"  - indica a ordem de preenchimento dos dados (geralmente na forma de vetor), se será por linhas ou colunas. 
      #                     o default é byrow = False, ou seja, preenchimento por colunas


matriz_vazia <- matrix( nrow = 3, ncol = 4)

matriz_por_coluna<- matrix(1:12, nrow= 3, ncol = 4) #preenchimento default, por colunas
matriz_por_coluna
matriz_por_linha <-matrix(1:12, nrow = 3, ncol = 4, byrow = T)
matriz_por_linha

matriz_dados_existentes<- matrix(cont3, nrow= 2, ncol=5) #utilizando o vetor cont3 que criamos anteriormente


#Listas
#As listas são uma estrutura parecida com vetores, mas que podem agrupar diferentes tipos de variaveis, classes, e até outras listas.
#Muito utéis para armazenar resultados 

lista_qualquer<-list(a,b,c,d, matriz_vazia)
#sério, dá para armazenar qualquer coisa
#usaremos listas no futuro para armazenar os resultados de uma iteração com for

#para testar se há itens vazios ou nulos, usamos o is.na() e is.null()
is.na(matriz_vazia) #retorna TRUE onde há dados na
is.null(matriz_vazia) #retorna TRUE se for vazia
jj<-c()
is.null(jj) 

#Indexação
#A indexação é util para "puxar" valores que estão dentro de um vetor, matriz, lista, tabela e etc.

#Vetor
#Para vetores, a sintaxe é:
# nome_vetor[posição]

#exemplo:
cont3[2]
#pode-se atribuir a uma variavel
f<-cont3[2:3]
#pode-se adicionar
f[3]<-c(3)
#pode-se modificiar
f[3]<-c(7)

#Matriz
#Para puxar um unico item, utiliza-se:
#nome_matriz[i,j], onde i é a linha e j a coluna
#exemplo:
matriz_por_coluna[1,2]

#para selecionar uma linha inteira, utiliza-se nome_matriz[i,], onde i é a linha desejada
matriz_por_linha[1,]

#para coluna, a sintaxe é semelhante, [,j]
matriz_por_linha[,1]


#Lista
#Para listas é utilizado o duplo colchete
lista_qualquer[[1]]
#para dados mais "profundos" (vetores dentro de um dos itens da lista, por exemplo), repete-se o duplo colchete
lista_qualquer[[5]][[6]]
#caso os itens da lista sejam nomeados, pode-se usar o nome entre aspas

listaa<-list("alunos" = c("Bruna", "Wallace", "Matheus"),
             "Idade" = c(24,23,25),
             "Habilidades" = list(
                              "matemática"= c("basica", "media", "avançada"),
                              "linguagens"= c("r", "matlab", "c")),
             "numeros" = list(
               c(1:10), c(10:1), list(
                 c(100:1), c(200:1)
               )
             )
)

#exemplos de indexação em listas utilizando o nome dos itens e com diferentes "profundidades"

listaa[["alunos"]][[1]] 
listaa[[1]][[1]]
listaa[["Habilidades"]][["matemática"]][[1]]
listaa[["numeros"]][[3]][[1]][[5]]

#

#Iteração

#Vamos usar um vetor de tamanho 100 com numeros aleatórios paara os nossos testes

teste_vetor<-sample(1:1000, 100, replace=TRUE)

#FOR
#For é uma estrutura de repetição que executa uma série de comandos a partir de uma condição
#a estrutura básica é:

for (variable in vector) {
  
}

#exemplo
h<-c() #vetor vazio

for (i in 1:20) { 
  h[i]<- mean(teste_vetor[(5*i-4):(5*i)]) #fazer a média a cada 5 pontos de 
}


#agora que temos um vetor com 20 pontos, vamos transformá-lo numa matriz

matriz_teste<-matrix(h,ncol=4, nrow= 5)

#Novamente iremos usar o for, dessa vez para retirar, min, max e média por coluna da matriz
min_col<-c() #precisamos declarar as variavéis antes de inseri-las no for
max_col<-c()
media_col <-c()


for (i in 1:4) {
  min_col[i]<- min(matriz_teste[,i])
  max_col[i]<-max(matriz_teste[,i])
  media_col[i]<-mean(matriz_teste[,i])
  
}

#Para encontrar min,max e média por linha da matriz, pode-se trocar a indexação para a de linha [i,].
#Mas vamos aproveitar para introduzir a função apply
#apply(x,1 ou 2, função)
  #Onde:
#   x = vetor ou matriz;
#   1 ou 2 para selecionar linha (1) ou coluna (2)
#   função/comando desejado

#exemplo:

min_lin<-apply(matriz_teste,1,min)
max_lin<-apply(matriz_teste,1,max)
media_lin <-apply(matriz_teste,1,mean)


#Tabela com tibble
tabelinha<- tibble("Max por coluna"=max_col,
                   "Min por coluna"= min_col,
                   "Media por coluna"=media_col,
                   "Max por lin"=max_lin) #não vai funcionar porque o tamanho de max_lin é diferente dos outros vetores


tabelinha<- tibble("Max por coluna"=max_col,
                   "Min por coluna"= min_col,
                   "Media por coluna"=media_col)


#Tabelas nomeadas
#Para tabelas com colunas nomeadas, utiliza-se:
#nome_da_tabela$nome_da_coluna 
#Ou pode-se usar o mesmo metódo de indexação de matrizes

#Carregar banco de dados externo

#vamos carregar um banco de dados no formato csv.
#O primeiro passo é definir o diretório onde o arquivo está. Isso pode ser feito de duas formas:
      # 1- No menu superior, vá em Session, Set Working Directory, Choose directory.
            #Abrirá uma caixa pop-up do windows/Linux e então deve-se escolhor a pasta onde o arquivo está.
      # 2- Caso saiba o caminho da pasta use o setwd()
#No meu caso, trabalhando no Rstudio intalado no pc, o arquivo está em:
setwd("C:/Users/bkfro/Desktop/Workshop R")

#Já no Rstudio cloud, foi feito upload do arquivo e está em:
setwd("/cloud/project")

#Existem inumeras funções para leitura de dados csv.
#Minha favorita é a read_delim, pois pertece ao pacote tidyverse e não gera problemas de incompatibilidade no futuro.
#Além disso, é possivel especificar o tipo de delimitador do pacote.
help(read.csv2) #aqui temos a descrição desta função, assim como outras semelhantes do pacote.

#A sintaxe básica é
#nome_desejado <- read.csv2("nome_do_arquivo.csv", sep= " ", dec = "", colnames= TRUE/FALSE)

#Os delimitadores mais comuns são:
        # Espaço - sep = "\"
        # Virgula - sep = ","
        # Ponto-virgula - sep = ";"

# "Dec=" é para definir o separador decimal;
#Colnames é para ativar ou desativar que a primeira linha seja de titulos das colunas. O default é TRUE e caso não tenha nomes, será dado automaticamente na forma de X1, X2 e etc.


#Vamos carregar esse banco de dados de carga retirado do site da ONS
carga<-read.csv2("Carga_de_Energia_Subsistema_Full_Data_data.csv", sep = ";", dec = ",")
#Agora que temos uma tabela carregada, vamos testar os indexadores!
carga[1,]
carga[,1]

subsistema<- carga$ï..Subsistema
#Essa tabela tem muitas colunas que não usaremos.
#Pode-se atribuir as colunas desejadas a vetor, com fiz em "subsistema", ou utilizar a função subset.

apenas_norte <- subset.data.frame(carga,
                            carga$ï..Subsistema  == "Norte", #condição lógica para o subset, no caso, selecionar apenas os dados equivalentes ao norte
                            select = c(1,5,10,11)) #aqui define quais colunas a serem selecionadas

nordeste <- subset.data.frame(carga,
                                  carga$ï..Subsistema == "Nordeste", #condição lógica para o subset, no caso, selecionar apenas os dados equivalentes ao norte
                                  select = c(1,5,10,11)) #aqui define quais colunas a serem selecionadas
Sul <- subset.data.frame(carga,
                              carga$ï..Subsistema == "Sul", #condição lógica para o subset, no caso, selecionar apenas os dados equivalentes ao norte
                              select = c(1,5,10,11)) 


Sudeste_Centro_oeste <- subset.data.frame(carga,
                         carga$ï..Subsistema == "Sudeste/Centro-Oeste",
                         select = c(1,5,10,11)) 
#Editar tabelas prontas
Norte<-as_tibble(apenas_norte) #colocando no formato tibble, a tabela do tidyverse que garante a compatibilidade com o ggplot
colnames(Norte)<-c("Subsistema", "Mês", "Carga_Energia_GWH", "Carga_Energia_Media") #editando o nome das colunas
Norte<- mutate(Norte, Num = c(1:12))

Nordeste<-as_tibble(nordeste) #colocando no formato tibble, a tabela do tidyverse que garante a compatibilidade com o ggplot
colnames(Nordeste)<-c("Subsistema", "Mês", "Carga_Energia_GWH", "Carga_Energia_Media") #editando o nome das colunas
Nordeste<- mutate(Nordeste, Num = c(1:12))

Sul<-as_tibble(Sul) #colocando no formato tibble, a tabela do tidyverse que garante a compatibilidade com o ggplot
colnames(Sul)<-c("Subsistema", "Mês", "Carga_Energia_GWH", "Carga_Energia_Media") #editando o nome das colunas
Sul<- mutate(Sul, Num = c(1:12))

Sudeste_Centro<-as_tibble(Sudeste_Centro_oeste) #colocando no formato tibble, a tabela do tidyverse que garante a compatibilidade com o ggplot
colnames(Sudeste_Centro)<-c("Subsistema", "Mês", "Carga_Energia_GWH", "Carga_Energia_Media") #editando o nome das colunas
Sudeste_Centro<- mutate(Sudeste_Centro, Num = c(1:12))


write.table(Norte, file = "norte.csv", sep = "\t",row.names = F) #salvando a tabela externamente

#Para selecionar apenas as colunas do nosso interesse
Carga_1<-subset(carga,
                select = c(1,5,10,11))

colnames(Carga_1)<-c("Subsistema", "Mês", "Carga_Energia_GWH", "Carga_Energia_Media")
Carga_1<-mutate(Carga_1, Num = c(1:48))


# Gráfico de barras por região
ggplot(Carga_1)+
  geom_col(aes(x=Carga_1$Subsistema, y=round(Carga_1$Carga_Energia_GWH,1)),fill= "blue")+
  labs(title = "Carga por Região entre 2018-2019 ") +xlab("Região")+ylab("Carga (GWh)")+theme_bw()



#Gráfico de linhas da região norte

graf<-ggplot() +
  geom_line(aes(x = Norte$Num , y= Norte$Carga_Energia_GWH)) +theme_bw()# fundo branco

#Gráfico de linhas para cada região
ggplot() +
  geom_line(aes(x = Norte$Num , y= Norte$Carga_Energia_GWH),color = "blue")+
  geom_line(aes(x = Nordeste$Num , y= Nordeste$Carga_Energia_GWH),color = "red")+
  geom_line(aes(x = Sul$Num , y= Sul$Carga_Energia_GWH),color = "green")+
  geom_line(aes(x = Sudeste_Centro$Num , y= Sudeste_Centro$Carga_Energia_GWH),color = "magenta")+
  scale_color_manual(labels = c("Norte","Nordeste", "Sul", "Sudeste/Centro Oeste"), values = c("blue", "red","green","magenta"))
#As cores ficam certas, mas sem legendas.

#Para adicionar a legenda, a cor deve ser declarada dentro do "aes". 
#Porém ocorre um bug em que as linhas ficam de cores trocadas em relação ao que foi declarado.
#A legenda segue a declaração. Sinceramente, não sei resolver e ajeito depois no inkscape.

ggplot() +
  geom_line(aes(x = Norte$Num , y= Norte$Carga_Energia_GWH,color = "blue"))+
  geom_line(aes(x = Nordeste$Num , y= Nordeste$Carga_Energia_GWH,color = "red"))+
  geom_line(aes(x = Sul$Num , y= Sul$Carga_Energia_GWH,color = "green"))+
  geom_line(aes(x = Sudeste_Centro$Num , y= Sudeste_Centro$Carga_Energia_GWH,color = "magenta"))+
  scale_color_manual(labels = c("Norte","Nordeste", "Sul", "Sudeste/Centro Oeste"), values = c("blue", "red","green","magenta"))



pdf(file = "graf.pdf",#
    width = 12,#
    height = 5)#
graf
dev.off()

pdf(file = "graf3.pdf")
graf
dev.off()


normal<-rnorm(100)

ggplot()+
  geom_histogram(aes(x=normal, y = ..density..), bins =10)
