# Exercice 1

df = read.csv (file = "D:/Prog stat/dataset/fao.csv" , header = TRUE,sep =";", dec = ",")

nrow(df)

summary(df)

# Execrice 2

mean(df$Dispo_alim,na.rm = TRUE)
#na.rm prend ou pas en compte les valeurs manquantes

sum(df$Population,na.rm = TRUE)

sd(df$Export_viande, na.rm = TRUE)
sd (df$Import_viande, na.rm = TRUE)

median(df$Prod_viande,na.rm = TRUE)

quantile(df$Dispo_alim)

quantile(df$Import_viande,prod = seq(from = 0.1,to = 0.9, by =0.1))
# ne pas oublier de mettre seq pour pouvoir mettre le form et tout

# Exercice 3

moins_peuple = order(df$Population)
resultat = head(df[moins_peuple,], n=5)
View(resultat)


plus = order(df$Population, decreasing = TRUE)
resultat = head(df[plus,],5)
View(resultat)

plus = order(df$Prod_viande, decreasing = TRUE)
resultat = head(df[plus,],5)
View(resultat)

plus = order(df$Import_viande, decreasing = TRUE)
resultat = head(df[plus,],5)
View(resultat)

kcal = subset(df,Dispo_alim >= 2300)
nrow(kcal)

kcal = subset(df,Dispo_alim > 3500 & Import_viande >= 1000 )
nrow(kcal)

pays = subset(df, Nom %in% c("France","Belgique"))
View(pays)



# Exercice 4

df$part_export = df$Export_viande / df$Prod_viande

df$dispo_alim_pays = df$Dispo_alim * df$Population

write.table(x = "df", file = "ExportTp2.csv")

dispo_alim_monde = sum(df$dispo_alim_pays, na.rm = TRUE)

nourir = dispo_alim_monde / 2300
nourir
# On peut nourir 9858300378 personnes


# Exercice 5

plot(x =df$Prod_viande ,y = df$Export_viande,xlab = "Production de viande", ylab = "Export de viande", main = " ")


cor(x = df$Export_viande ,y = df$Prod_viande, use = "complete.obs")
# use = "complete.obs" est égale à na.rm

matrice = cor(df[ , - 1] , use = "complete.obs")
matrice = round(matrice , 2)
View(matrice)


install.packages("corrplot")

library(corrplot)
corrplot(matrice, method = "color")












