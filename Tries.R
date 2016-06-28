



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
#


# sauvegarder sous forme rds ou Rda
# ----------------------------------

if (!dir.exists("dummydata")) {dir.create("dummydata")}

dummydir <- "dummydata"
exfnameRds <- "example.Rds"
exfnameRda <- "example.Rda"
exfpathRds <- file.path(".", dummydir, exfnameRds)
exfpathRda <- file.path(".", dummydir, exfnameRda)


file.create(exfpathRds)


x <- 1:5

save(x, file=exfpathRda)
saveRDS(x, file=exfpathRds)
rm(x)

## ASSIGN USING readRDS
new_x1 <- readRDS(file=exfpathRds)
new_x1
## [1] 1 2 3 4 5

## 'ASSIGN' USING load -- note the result
new_x2 <- load(exfpathRda)

# loading in to  <environment: R_GlobalEnv
new_x2
# [1] "x"
# # NOTE: `load()` simply returns the name of the objects loaded. Not the values.
x
##[1] 1 2 3 4 5



# another experiment
y <- 10:20
x <- 1:5

save(x,y, file=exfpathRda)

rm(x)
rm(y)

x
y

ll <- load(exfpathRda)
ll
x
y
