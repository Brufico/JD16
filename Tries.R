



# Si il faut lire les données des filières et les fusionner



#' Junk
#
# # joining dataframes
# # maindf0$key <- paste(maindf0$nom, maindf0$prenom, sep = "_")
#
#
# # faire une clé
# maindf0 <- within(maindf0,
#                   key <- paste(nom, prenom, sep = "_")
# )
# fildf0 <- within(fildf0,
#                   key <- paste(nom, prenom, sep = "_")
# )
#
# # vérification des clés
#
# # colnames(maindf0)
# # colnames(fildf0)
#
# maindfk <- maindf0 %>%
#         arrange(nom, prenom) %>%
#         select(nom, prenom, key)
#
# fildfk <- fildf0 %>%
#         arrange(nom, prenom) %>%
#         select(nom, prenom, key)
#
# kk <- cbind(maindfk, fildfk)


#
# sum(fildfk$nom != maindfk$nom)











