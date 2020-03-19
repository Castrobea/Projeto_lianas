## Iniciando o fluxo de trabalho

# Importando tabelas

areabasal <- read.table("Data/tab_ab.txt", header = T)
abundancia <- read.table("Data/tab_abd.txt", header = T)
altura <-read.table("Data/tab_h.txt", header = T)

# Verificando dados
head(areabasal)
dim(areabasal)
summary(areabasal)

head(abundancia)
dim(abundancia)
summary(abundancia)

head(altura)
dim(altura)
summary(altura)

# Juntando tabelas por meio de um identificador comum (chave primária)

areabasal$area

summary(areabasal$area)
class(areabasal$area)
class(abundancia$area)
class(altura$area)

ab.abd <- merge(areabasal, abundancia, by = "area")

dim(ab.abd)
head(ab.abd)

estrutura <- merge(ab.abd, altura, by = "area")
estrutura

# Exportando a planilha completa
write.csv(x = estrutura,
          file = "Data/planilha_completa",
          row.names = FALSE)

# Calculando alguns parâmetros
summary(estrutura)

# Média
mean(estrutura$ab[1:4])
mean(estrutura$ab[5:8])
mean(estrutura$ab[9:12])

mean(estrutura$abd[1:4])
mean(estrutura$abd[5:8])
mean(estrutura$abd[9:12])

mean(estrutura$altura[1:4])
mean(estrutura$altura[5:8])
mean(estrutura$altura[9:12])

# Criando e salvando boxplot com as variáveis estruturais
par(mfrow=c(1,3))

variaveis <- rep(c("GA", "IN", "RE"), each=4)

boxplot(estrutura$altura~variaveis,
        xlab = "Tratamentos",
        ylab = "Altura (m) dos indivíduos",
        las=1)
mtext("A", 3, adj = 0, font = 1)

boxplot(estrutura$ab~variaveis,
        xlab = "Tratamentos",
        ylab = "Área basal (m²) dos indivíduos",
        las=1)
mtext("B", 3, adj = 0, font = 1)

boxplot(estrutura$abd~variaveis,
        xlab = "Tratamentos",
        ylab = "Abundância dos indivíduos",
        las=1)
mtext("C", 3, adj = 0, font = 1)

png("Output/Boxplot_estrutura.png",
    res = 300,
    width = 2400,
    height = 1200)

dev.off()
