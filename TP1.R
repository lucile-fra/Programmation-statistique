#Exercice 1

iris
class(iris)

View(iris)

nombre_ligne = nrow(iris)
nombre_colonne = ncol(iris)

colnames(iris)

summary (iris)


iris[,c("Sepal.Length","Species")]
# à gauche,le nombre de ligne ou des lignes en particulier'
# à droite,le nombre de colonne ou des colonnes en particulier'

iris[c(100,103,105),]

iris[c(50:100),]

mean(iris$Sepal.Length)

median(iris$Sepal.Width)

sd(iris$Petal.Length)

quantile(iris$Petal.Width, probs=seq(from = 0.1, to = 0.9,by = 0.1))


# Exercice 2
# 1
dfManga <- read.csv("D:/Prog stat/manga.csv",header = TRUE, sep = ",",dec = ".")
dfAnime <- read.csv("D:/Prog stat/anime.csv",header = TRUE, sep = ",",dec = ".")
class(dfManga)
class(dfAnime)


#3
dim(dfManga)
dim(dfAnime)

#4
mean(dfAnime$Score)
mean(dfManga$Score)

#5
sum(dfAnime$Vote)
sum(dfManga$Vote)

#6
sd(dfAnime$Score)
sd(dfManga$Score)

#6
quantile(dfAnime$Score,probs=seq(0.1,0.9,by = 0.1))
quantile(dfManga$Score,probs=seq(0.1,0.9,by = 0.1))


# Filtre manga

ext1=subset(dfManga,Score>9)
nrow(ext1)

ext2=subset(dfManga,Vote >= 200000)
nrow(ext2)

ext3=subset(dfManga,Vote > 200000 & Score >= 8)
nrow(ext3)


ext4=subset(dfManga,Score >= 7 & Score <= 8)
nrow(ext4)

# Filtre sur les animes

print(table(dfAnime$Rating))
length(table(dfAnime$Rating))
#correction
prop.table(table(dfAnime$Rating))

ani_ext1 = subset(dfAnime, Rating == "R - 17+ (violence & profanity)")
nrow(ani_ext1)

ani_ext2 = subset(dfAnime, Rating == "R - 17+ (violence & profanity)" & Score > 8)
nrow(ani_ext2)

ani_ext3 = subset(dfAnime, Rating != "R - 17+ (violence & profanity)")
nrow(ani_ext3)

ani_ext4 = subset(dfAnime, Rating %in% c("PG - Children","G - All Ages"))
nrow(ani_ext4)
# ne pas mettre == car on veut vérifier si le rating est dans notre c ou pas.

ani_ext5 = subset(dfAnime, !Rating %in% c("PG - Children","G - All Ages"))
nrow(ani_ext5)
# ne pas oublier le !

ani_ext6 = subset(dfAnime, Score >= 9 & Vote > 400000)
nrow(ani_ext6)




dfAnime = dfAnime[,c("Title","Score","Vote","Ranked")]
dfManga = dfManga[,c("Title","Score","Vote","Ranked")]


dfAnime$Type = "Anime"
dfManga$Type = "Manga"
# Pour créer une colonne faire $ avec le nom pour y accéder et lui donner sa valeur


dfConcat = rbind(dfAnime, dfManga)
View(dfConcat)


write.table (dfConcat,file = "D:/Prog stat/ExportTp1.csv", sep = ",", row.names = TRUE)














