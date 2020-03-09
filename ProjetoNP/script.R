
# Lendo o banco -----------------------------------------------------------
cadastro <- read.csv('https://raw.githubusercontent.com/Manuelfjr/NumericalMethods/master/ProjetoNP/DadosCompletosMovimentacao.csv',sep=';')
cadastroG <- cadastro[cadastro$Município.UF == 'Guarulhos/SP', ]
View(cadastro)
cadastro2015 <- subset(cadastro, cadastro$Ano == 2015)
cadastro2017 <- subset(cadastro, cadastro$Ano == 2017)
cadastro2019 <- subset(cadastro, cadastro$Ano == 2019)

# Graficos e informações basicas ------------------------------------------
plot(cadastroG$Passageiro..un., cadastroG$Aeronave..un., type = 'h')
hist(cadastroG$Passageiro..un.)
cadastroG2004 <- subset(cadastroG, cadastroG$Ano == 2004)
cadastroG2008 <- subset(cadastroG, cadastroG$Ano == 2008)
cadastroG2012 <- subset(cadastroG, cadastroG$Ano == 2012)


plot(cadastroG2004$Passageiro..un.)
plot(cadastroG2008$Passageiro..un.)
plot(cadastroG2012$Passageiro..un.)


regression.model <- lm(cadastro2015$Aeronave..un.~cadastro2015$Passageiro..un.,data=cadastroG)
plot(cadastroG$Aeronave..un.,cadastroG$Passageiro..un.)


plot (cadastro2015$Aeronave..un. ~ cadastro2015$Passageiro..un.,pch=21 ,data = cadastroG, col = 'gray40')
abline(regression.model,col="darkblue") # Esta função ajusta a reta do modelo aos dados

summary(regression.model)

hist( cadastroG2004$Aeronave..un.)
hist(cadastroG2008$Aeronave..un.)
hist(cadastroG2012$Aeronave..un.)

cor(cadastroG$Passageiro..un., cadastroG$Aeronave..un.)
dim(cadastroG)


