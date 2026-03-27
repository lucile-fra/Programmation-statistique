fichier = list.files(path = "D:/Prog stat/dataset/nba",
                 pattern = ".csv$",
                 full.names = TRUE)

library(tools)
print(fichier[1])
nom_fichier = basename(path = fichier[1])
nom_fichier_sans_ext = file_path_sans_ext(x= nom_fichier)
print(nom_fichier_sans_ext)

# Lire le fichier CSV et l'affecter à une variable avec le nom du fichier
assign(x= nom_fichier_sans_ext,
       value = read.csv(fichier[1],
                        sep= ",",
                        dec="."))
#un dataframe vient d'être créé avec comme nom d'objet le nom du fichier sans extension.


for (i in fichier) {
  nom_objet = file_path_sans_ext(basename(i))
  # Extraire le nom du fichier sans extension
  
  heure_debut = Sys.time()
  assign(x= nom_objet,
         value = read.csv(i,
                          sep= ",",
                          dec="."))
  heure_fin = Sys.time()
  # on calcule le temps écouler
  temps_execution = heure_fin - heure_debut
  cat("Importation :", nom_objet, "=", temps_execution, "\n")
}




# Exercice 2


LA = subset(team, city == "Los Angeles", select = c("id","city"))
matche_nba = subset(game, select = c("team_id_home", "game_id"))
jointure_1 = merge(x = LA, y = matche_nba,
      by.x = "id",
      by.y = "team_id_home",
      all.x = TRUE)

nrow(jointure_1)
# Il y a 5216 matchs qui se sont déroulés à LA depuis la création de la NBA


df_y = subset(game_info, select = c("game_id", "attendance"))
jointure_2 = merge(x= jointure_1 , y=df_y,
                   by="game_id",
                   all.x = TRUE)
mean(jointure_2$attendance, na.rm = TRUE)
# L'affluence moyenne est de 14 846.72 personnes par matchs


df_x = subset(game_summary, season == 2020, select = c("game_id", "season"))
jointure_3 = merge(x= df_x , y= officials,
                   by = "game_id",
                   all.x = TRUE)
length(unique(jointure_3$official_id))
# 80 arbitres différents ont officié durant la saison 2020


df_x = subset(game_summary,select = c("game_id", "season"))

df_y = subset(officials, first_name == "Dick" & last_name == "Bavetta")

jointure_4 = merge(x = df_x, y = df_y, 
               by = "game_id",
               all.y = TRUE)
View(jointure_4)
table(jointure_4$season)


# Exercice 3

install.packages("DBI")
install.packages("RSQLite")

library(DBI)
library(RSQLite)
mydb = dbConnect(SQLite(), "nbaDb.sqlite")

dbListTables(mydb)



















