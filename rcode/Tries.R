



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

x <- .03
y <- .05
z <- .1
estsignif <- ifelse(x < y,"est", ifelse(x < z,"est peu", "n'est pas"))
estsignif



#==================================================================================
#initialization for knitting
#
#' Loading packages and code
#' ================

library(dplyr)
library(ggplot2)

#' Sourcing more code
#' ================
#'
# more code
workdir <- getwd()
#maindir <- ".."
maindir <- workdir
mcodir <- "addcode"
code1name <- "utils.R"
source(file.path(maindir ,mcodir, code1name))

# more code :  standard functions
stdfundir <- "standardfunctions"
stdfunname <- "standardfunctionsV4.R"
source(file.path(maindir, stdfundir, stdfunname))

#'
#' Récupération des données prétraitées
#' ====================================
#'

# path(rda)
datadir2 <- "data2"
alldatapath <- file.path(maindir, datadir2, "alldata.Rda")
# loading
whatload <- load(alldatapath)
# verification
# whatload
# -------------------------------------------------------------------

verbatim("situation_etudes_intitule")

res <- verbatim2("situation_etudes_intitule", bynomfact = "situation_etudes_etablissement")
setresult('situation_etudes_intitule')


numc <- length(nonavect(maindf[["situation_etudes_intitule"]]))

sit <- verbatim(repdf, "situation_etudes_intitule" )
sit$numcases
