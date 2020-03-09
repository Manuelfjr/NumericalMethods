

cadastro <- read.csv("DadosCompletosMovimentacao.csv", sep = ';')
View(cadastro)



# Variáveis de interesse: Ano, mês, número de passageiros, número de voos,
# municipío

# Adicionando variável numérica que corresponde ao mês:
cadastro$ID_mes <- numeric(nrow(cadastro))
cadastro$ID_mes[cadastro$Mes == "Janeiro"] <- 1
cadastro$ID_mes[cadastro$Mes == "Fevereiro"] <- 2
cadastro$ID_mes[cadastro$Mes == "MarÃ§o"] <- 3
cadastro$ID_mes[cadastro$Mes == "Abril"] <- 4
cadastro$ID_mes[cadastro$Mes == "Maio"] <- 5
cadastro$ID_mes[cadastro$Mes == "Junho"] <- 6
cadastro$ID_mes[cadastro$Mes == "Julho"] <- 7
cadastro$ID_mes[cadastro$Mes == "Agosto"] <- 8
cadastro$ID_mes[cadastro$Mes == "Setembro"] <- 9
cadastro$ID_mes[cadastro$Mes == "Outubro"] <- 10
cadastro$ID_mes[cadastro$Mes == "Novembro"] <- 11
cadastro$ID_mes[cadastro$Mes == "Dezembro"] <- 12

banco_g <- subset(cadastro, cadastro$Municipio.UF == "Guarulhos/SP")

View(banco_g)

# Plot:

banco_g_2015 <- subset(banco_g, banco_g$Ano == 2015)
banco_g_2017 <- subset(banco_g, banco_g$Ano == 2017)
banco_g_2019 <- subset(banco_g, banco_g$Ano == 2019)

plot.new()
plot.window(xlim = c(1,12), ylim = c(5e6,10e6))

axis(1, at = 1:12, labels = c("Jan", "Fev", "Mar", "Abr", "Mai","Jun",
                              "Jul", "Ago", "Set", "Out", "Nov", "Dez"))

axis(2, at = c(5e6, 6e6, 7e6, 8e6, 9e6, 10e6),
     labels = c('5', '6', '7', '8', '9', '10'))

title(xlab = "Mês", ylab = "Total de passageiros (milhões)",
      main = "Fluxo de passageiros em Guarulhos em 2015")
grid()

lines(1:12, as.numeric(tapply(banco_g_2015$Passageiro_.un.,
                              INDEX = banco_g_2015$ID_mes, FUN = sum)),
      col = "red", lwd = 2)
points(1:12, as.numeric(tapply(banco_g_2015$Passageiro_.un.,
                             INDEX = banco_g_2015$ID_mes, FUN = sum)),
     col = "red", bg = "white")

lines(1:12, as.numeric(tapply(banco_g_2017$Passageiro_.un.,
                              INDEX = banco_g_2017$ID_mes, FUN = sum)),
      col = "darkgreen", lwd = 2)
points(1:12, as.numeric(tapply(banco_g_2017$Passageiro_.un.,
                               INDEX = banco_g_2017$ID_mes, FUN = sum)),
       col = "darkgreen", bg = "white")

lines(1:12, as.numeric(tapply(banco_g_2019$Passageiro_.un.,
                              INDEX = banco_g_2019$ID_mes, FUN = sum)),
      col = "darkblue", lwd = 2)
points(1:12, as.numeric(tapply(banco_g_2019$Passageiro_.un.,
                               INDEX = banco_g_2019$ID_mes, FUN = sum)),
       col = "darkblue", bg = "white")

legend(1.5, 1e7, fill = c("red", "darkgreen", "darkblue"),
       title = "Ano", cex = 0.6, 
       legend =  c("2015", "2017", "2019"))
