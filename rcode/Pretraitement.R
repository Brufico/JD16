#' ---
#' title: "Enquête JD 2015"
#' subtitle: "Code: Lecture et prétraitement des données"
#' author: "Bruno Fischer Colonimos"
#' date: "22 juin 2016"
#' output:
#'      html_document:
#'         css: customex2.css
#'      number_sections: yes
#'      theme: readable
#'      toc: yes
#' pdf_document:
#'         toc: yes
#' word_document: default
#' ---
#'

#' Loading packages
#' ================

library(dplyr)
library(ggplot2)

#' Loading more code
#' ================
#'
# more code dir
mcodir <- "addcode"
code1name <- "utils.R"
source(file.path(".", mcodir, code1name))



#' Les Données principales
#' =======================
#'
#' Envoyées par Daphné le 20/06, export total (avec colonnes dates).
#' sauvegardées dans le sous-répertoire 'data'

#'La liste des filière. Envoyée par Christine Rhodes le 2/6
#'Les deux listes ont été fusionnées sous Excel, avec le problèmes notés plus bas
#'

#'
#' Lecture
#' ----------
#'

# dir(path = datadir)
datadir = "data"
fname1 <- "datajd0620+f.csv"
fpath1 <- file.path(".", datadir, fname1)
# read the data in as 'maindf'
maindf <- read.csv(fpath1, sep=";", na.strings = "")


#'
#' Nettoyage
#' ----------
#'
#' ### Elimination de colonnes inutiles
#'
# eliminer colonnes 'Date_creation' ou 'Date_maj'
keepcol <- !grepl(pattern = "^Date_", x = colnames(maindf))
maindf <- maindf[ , keepcol]
# eliminer la dernière ligne (vide)==> inutile maintenant
# maindf <- maindf[ -345,]


# unique(maindf$filiere)
# levels(maindf$filiere)

#  REM Problèmes avec la liste des filières
#  Civilite	Prenom	Nom	Centre	Nom Filiere	multiplicité
# MLLE	Charline	MALLET	PARIS	Management et gestion des actifs patrimoniaux	2
# MLLE	Gladys	MALLET	PARIS	Marketing – Communication et Publicité	2
# MLLE	Diane-Charlotte	SIMON	PARIS	Business Management - CUNY	2
# M	Thibault	SIMON	PARIS	Stratégie commerciale et développement d’affaires	2

# FUCHS	Theresa Marie (pas de correspondance ==> Füchs) International Marketing	NICE



#' ### Ajustement du type de certaines variables

# Nom et prénom ==> as.character
maindf$nom <- as.character(maindf$nom)
maindf$prenom <- as.character(maindf$prenom)

# * 25 Depuis combien de temps êtes-vous à la recherche d'un emploi ? *situation_temps_recherce* ==> ordonné

# levels(maindf$situation_temps_recherce)
maindf$situation_temps_recherce <- factor(x = maindf$situation_temps_recherce,
                                          levels = c("Depuis moins de 2 mois",
                                                     "2 mois à moins de 4 mois",
                                                     "4 mois à moins de 6 mois",
                                                     "6 mois et plus"),
                                          ordered = TRUE)
# table(maindf$situation_temps_recherce)

# 28
# maindf$situation_difficultes_projet

# 29-31 Précisez
maindf$X_autre_details <- as.character(maindf$X_autre_details)


# * 37 Il s'agit d'un° *emploi_actuel_premier_second* (166) **[ord]**
# levels(maindf$emploi_actuel_premier_second)
maindf$emploi_actuel_premier_second <- factor(x = maindf$emploi_actuel_premier_second,
                                          levels = c("1er emploi depuis la sortie de l'école",
                                                     "2ème emploi ou plus depuis la sortie de l'école"),
                                          ordered = TRUE)
# table(maindf$situation_temps_recherce)

# * 52 Quelle est la taille de l'entreprise ... *entreprise_taille* (139) **[ord]**

# levels(maindf$entreprise_taille)
maindf$entreprise_taille <- factor(x = maindf$entreprise_taille,
                                              levels = c( "inférieur à 10 salariés",
                                                          "de 10 à 19",
                                                          "de 20 à 49",
                                                          "de 50 à 99",
                                                          "de 100 à 249",
                                                          "de 250 à 499",
                                                          "de 500 à 1 999",
                                                          "de 2 000 à 4 999",
                                                          "de 5 000 à 9 999",
                                                          "de 10 000 à 49 999",
                                                          "50 000 salariés et plus"),
                                   ordered = TRUE)
# table(maindf$situation_temps_recherce)




#' ### Les langues
#'
#'
# 64 Utilisez-vous fréquemment les langues suivantes dans votre travail ? **[ord]**
# ---------------------------------------------------------------------------------
# *votre_emploi_langues_francais* (145),
# *votre_emploi_langues_anglais* (140),
# *votre_emploi_langues_allemand* (129)
# *votre_emploi_langues_espagnol* (128)

# levels(maindf$votre_emploi_langues_francais)

# votre_emploi_langues_francais
## -----------------------------------
factname <- "votre_emploi_langues_francais"
maindf[[factname]] <- factor(x = maindf[[factname]],
                                   levels = c( "Jamais","Très rarement",
                                               "Rarement (quelques fois par mois)",
                                               "Souvent (plusieurs heures par semaine)",
                                               "Quotidiennement"),
                                   ordered = TRUE)
# faire une echelle de likert
factname_lik <- paste(factname,"lik", sep = "_")
maindf[[factname_lik]] <- as.numeric(maindf[[factname]])

# table(maindf[[factname_lik]])


## -----------------------------------
## idem *votre_emploi_langues_anglais*
factname <- "votre_emploi_langues_anglais"
maindf[[factname]] <- factor(x = maindf[[factname]],
                             levels = c( "Jamais","Très rarement",
                                         "Rarement (quelques fois par mois)",
                                         "Souvent (plusieurs heures par semaine)",
                                         "Quotidiennement"),
                             ordered = TRUE)
# faire une echelle de likert
factname_lik <- paste(factname,"lik", sep = "_")
maindf[[factname_lik]] <- as.numeric(maindf[[factname]])

## ----------------------------------------
## idem *votre_emploi_langues_allemand*
factname <- "votre_emploi_langues_allemand"
maindf[[factname]] <- factor(x = maindf[[factname]],
                             levels = c( "Jamais","Très rarement",
                                         "Rarement (quelques fois par mois)",
                                         "Souvent (plusieurs heures par semaine)",
                                         "Quotidiennement"),
                             ordered = TRUE)
# faire une echelle de likert
factname_lik <- paste(factname,"lik", sep = "_")
maindf[[factname_lik]] <- as.numeric(maindf[[factname]])


## ----------------------------------------
## idem *votre_emploi_langues_espagnol*
factname <- "votre_emploi_langues_espagnol"
maindf[[factname]] <- factor(x = maindf[[factname]],
                             levels = c( "Jamais","Très rarement",
                                         "Rarement (quelques fois par mois)",
                                         "Souvent (plusieurs heures par semaine)",
                                         "Quotidiennement"),
                             ordered = TRUE)
# faire une echelle de likert
factname_lik <- paste(factname,"lik", sep = "_")
maindf[[factname_lik]] <- as.numeric(maindf[[factname]])


# cleaning
rm(factname, factname_lik)



#' ### Correspondance Secteurs - Secteurs pour L'Etudiant

# création de la table
tablesect <- data.frame(v1=levels(maindf$entreprise_secteur), v2= c("") )
# sauvegarde dans "tables de correspondance"
datadir1 <- "tables de correspondance"
fnametb1 <- "tablesecteurs.csv"
pathtb1 <- file.path(".", datadir1, fnametb1)
# ecriture
write.table(tablesect, pathtb1, sep=";",row.names = FALSE)
# Lecture de la table complétée avec Excel
fnametb2 <- "tablesecteursok.csv"
pathtb2 <- file.path(".", datadir1, fnametb2)

tablesect <- read.table(pathtb2, header = TRUE, sep = ";", quote = "", comment.char = "")

# nouvelle variable secteurs

maindf$entreprise_secteur_letudiant <- vlookup(maindf$entreprise_secteur,searchtable = tablesect)




#'
#' Nettoyage des données de rémunération
#' -------------------------------------
#'

#' variables concernées:
#' "votre_emploi_remuneration_variable"
#' "votre_emploi_remuneration_brut"
#' + variable ajoutée "votre_emploi_remuneration_total" (à faire)
#'
#' les variables ont été lues en tant que facteur: pipeline =
#' facteur => as.character() => correction des conneries texte (gsub()) => as.numeric()
#'
#' ensuite : detection des outliers
#' ==> table de cas suspects == suspectdf
#' ==> correction au cas par cas ou demande de renseignements complémentaires
#' ==> génération de tables de corrections et de demande de rens



# Traitement pb de saisie de nombre et détection de  problèmes de sens
# --------------------------------------------------------------------


# première variable
vname <-  "votre_emploi_remuneration_brut" # nom de la variable
vnvect <- maindf[[vname]]
# factor ==> numeric
vnvect <- as.character(vnvect)
# vnvect #dbg

# eliminer les".", " " et "?"
vnvect<- gsub(x= gsub(x= vnvect, pattern = "\\.", replacement="" ),
              pattern = "\\?", replacement="")
vnvect <- gsub(x = vnvect, pattern = " ", replacement = "")
# vnvect #dbg
vnvect <-  as.numeric(vnvect)
# input back in the dataframe
maindf[[vname]] <- vnvect

# try detect the outliers with the boxplot approach
s <- summary(vnvect)
ocoef <- 1.5
limits <- c( s["1st Qu."] - ocoef * IQR(vnvect, na.rm = TRUE), s["3rd Qu."] + ocoef * IQR(vnvect, na.rm = TRUE))

indxoutliers1 <- which(vnvect < limits[1] | vnvect > limits[2])




# recommencement avec la variable votre_emploi_remuneration_variable
vname <-  "votre_emploi_remuneration_variable" # nom de la variable
vnvect <- maindf[[vname]]
vnvect <- as.character(vnvect)
# vnvect
vnvect<- gsub(x= gsub(x= vnvect, pattern = "\\.", replacement="" ),
              pattern = "\\?", replacement="")
vnvect <- gsub(x = vnvect, pattern = " ", replacement = "")
# vnvect
vnvect <-  as.numeric(vnvect)
# input put back in the dataframe
maindf[[vname]] <- vnvect

# la détection d'outliers ne fonctionne pas bien
# s <- summary(vnvect)
# ocoef <- 2
# limits <- c( s["1st Qu."] - ocoef * IQR(vnvect, na.rm = TRUE), s["3rd Qu."] + ocoef * IQR(vnvect, na.rm = TRUE))
#
# indxoutliers1 <- which(vnvect < limits[1] | vnvect > limits[2])
limits <- c(1000,10000)
indxoutliers2 <- which(vnvect < limits[1] | vnvect > limits[2])


# autre problème potentiel:
# "votre_emploi_remuneration_variable"
"votre_emploi_remuneration_brut"
indxoutliers3 <- which(is.na(maindf[["votre_emploi_remuneration_brut"]]) &
                               !is.na(maindf[["votre_emploi_remuneration_variable"]]))


# collection cumulée de problèmes éventuels
indxoutliers <- unique(c(indxoutliers1,indxoutliers2, indxoutliers3))


suspectdf <-  data.frame("Index" = indxoutliers,
                         nom = maindf$nom[indxoutliers],
                         prenom = maindf$prenom[indxoutliers],
                         "remuneration_brut" = maindf$votre_emploi_remuneration_brut[indxoutliers],
                         "remuneration_variable" = maindf$votre_emploi_remuneration_variable[indxoutliers],
                         stringsAsFactors=FALSE)
# suspectdf

######## do not run
# pour vérifier le reste
# supposedokdf <- maindf[-indxoutliers, c("votre_emploi_remuneration_brut", "votre_emploi_remuneration_variable")]

# curieux problème de typage : nom et prenom deviennent des facteurs? ==> ,stringsAsFactors=FALSE
# suspectdf$nom <- as.character(suspectdf$nom)
# suspectdf$prenom<- as.character(suspectdf$prenom)






# solution des problèmes ou recherche complémentaire
# ---------------------------------------------------
#
#initialiser les listes de corrections faites ou de modifications à faire
verifdf <- data.frame(integer(0), character(0), character(0), numeric(0), numeric(0),
                      stringsAsFactors=FALSE)
corrigdf0 <- data.frame(numeric(0),
                        character(0), character(0),
                        numeric(0), numeric(0), numeric(0), numeric(0),
                        stringsAsFactors=FALSE)
# corrigdf1 <- data.frame(numeric(1), character(1), character(1), numeric(1), numeric(1), numeric(1), numeric(1))
corrigdf1 <- data.frame(numeric(1), c("***"), c("***"), numeric(1), numeric(1), numeric(1), numeric(1),
                        stringsAsFactors=FALSE)

# corrigdf1[1, 2] <- "xxx"
# corrigdf1[1, 3] <- "xxx"

corrigdf <- corrigdf0
colnames(verifdf) <- colnames(suspectdf)
colnames(corrigdf) <- c(colnames(suspectdf)," corr.brut", "corr.variable")
colnames(corrigdf0) <- c(colnames(suspectdf)," corr.brut", "corr.variable")
colnames(corrigdf1) <- c(colnames(suspectdf)," corr.brut", "corr.variable")


# fonctions de vérifications/corrections
rmverifier <- function(i) {
        j <- suspectdf[i,1]
        # message(paste0("verif ",j) ) #dbg
        maindf[j, "votre_emploi_remuneration_brut"] <<- NA
        maindf[j, "votre_emploi_remuneration_variable"] <<- NA
        # cat(paste0(suspectdf[i,"nom"],", ", suspectdf[i,"prenom"], "\n"))
        verifdf <<- rbind(verifdf,suspectdf[i,]) # effet de bord
}

rmcorriger <- function(i, corbrut = NULL, corvar = NULL, lcorrig = corrigdf1) {
        j <- suspectdf[i,1] # index dans maindf
        # message(paste0("corr ",j) )
        if (!is.null(corbrut)) {maindf[j, "votre_emploi_remuneration_brut"] <<- corbrut} # effet de bord
        if (!is.null(corvar)) {maindf[j, "votre_emploi_remuneration_variable"] <<- corvar} # effet de bord
        # message(paste0("maindf ok ",j) )
        for (k in 1:5) {
                # message(paste0("loop ", k))
                lcorrig[1,k] <- suspectdf[i, k]}
        if (is.null(corbrut)) {lcorrig[1,6] <- NA
        } else {lcorrig[1,6] <- corbrut}

        if (is.null(corvar)) {lcorrig[1,7] <- NA
        } else {lcorrig[1,7] <- corvar}
        corrigdf <<- rbind(corrigdf,lcorrig) # effet de bord
}

rmaccepter <- function(i, lcorrig=corrigdf0) {
        for (k in 1:5) {lcorrig[1,k] <- suspectdf[i,k]}
        lcorrig[1,6] <- NA
        lcorrig[1,7] <- NA
        corrigdf <<- rbind(corrigdf,lcorrig) # effet de bord
}

# exécution des vérifications/corrections
rmverifier(1)
rmverifier(2)
rmverifier(3)
rmverifier(4)
rmverifier(5)
rmcorriger(6, 24000, 12000) # PANTIN          ANTOINE  ==> confusion total /variable !!!!!!!!!!!!!
rmverifier(7) #BELLONI            Lorna
rmcorriger(8, 28000, 7000) #TULPAIN  Paul-Arnaud c0nfusion Euro/keuro
rmverifier(9)
rmcorriger(10, 34000) # HENRY  Romuald ordre de grandeur: 340 000 ==> 34000
rmaccepter(11)
rmverifier(12)
rmcorriger(13, 28000, NULL) #FROMANTIN Thibaut 28/ 28000
rmverifier(14)
rmverifier(15)
rmcorriger(16, 28000, 2000)
rmcorriger(17, 32000, 0) # LE SCEL            Manon
rmcorriger(18, 23328, 28000 - 23328) # FREVAL           Victor==> confusion total /variable + interversion
rmcorriger(19, NULL , 38000 - 35100) # LISNARD           Sophie
rmcorriger(20, NULL , 0) # FREITAS ROCHA         Caroline ==> répétition même nombre
rmcorriger(21, 25000 , 31000 - 25000) #LAGOMANZINI             Tony
rmcorriger(22, NULL , 42000 - 35000) #YASSINE             Dany
rmcorriger(23, 42000 , 0) # BEAUCARNOT         Emmanuel
rmcorriger(24, 37000 , 0) # MAZEAUD         Bertrand
rmcorriger(25, 24000 , 2000) # CABANES-TARCHER        Alexandre
rmaccepter(26)
rmcorriger(27, 40000 , 5000) # CHAOUACHI            Sarah
rmcorriger(28, NULL , 2000) # JEGOU           Pierre
rmcorriger(29, 36000 , 2000) #GUAY        Charlotte
rmcorriger(30, 30000 , 10000) # GUILLOREL          Pauline
rmcorriger(31, NULL , 3600)# MASSAFERRO              Ugo
rmcorriger(32, NULL , 39780 - 30600)# LY          Sophany
rmcorriger(33, NULL , 10000) #STRAZEL            Régis
rmcorriger(34, NULL , 34000 - 28000)#  POUJOIS          Jessica
rmcorriger(35, NULL , 1000) # LE BOUSSE            Julie
rmcorriger(36, NULL , 0) #DUCROT        Alexandra
rmcorriger(37, 20000 , 16000) #SUBIRA-PUIG           Arthur
rmcorriger(38, NULL , 2000)
rmcorriger(39, NULL , 0)
rmcorriger(40, NULL , 8000)
rmcorriger(41, NULL , 2000)
rmcorriger(42, NULL , 4000)
rmcorriger(43, 37000 , 0)
rmcorriger(44, NULL , 2000)
rmcorriger(45, NULL , 6000)
rmaccepter(46)
rmverifier(47)

# voir les tables ??
# corrigdf
# verifdf

#'
#' Création de la variable remuneration_totale
#' -------------------------------------------
#'
#'
maindf <-
within(maindf,{
        votre_emploi_remuneration_total <-
                ifelse(is.na(votre_emploi_remuneration_brut) &
                               is.na(votre_emploi_remuneration_variable),
                                NA,
                                ifelse(is.na(votre_emploi_remuneration_brut),
                                       votre_emploi_remuneration_variable,
                                       ifelse(is.na(votre_emploi_remuneration_variable),
                                              votre_emploi_remuneration_brut,
                                              votre_emploi_remuneration_brut +
                                                      votre_emploi_remuneration_variable)))
} )


#'
#' Suite du nettoyage des données
#' ------------------------------
#'

# semble ok pour l'instant






#' Eléments sur la structure de l'échantillon
#' ==========================================

# nombre de diplomés
ndip <- nrow(maindf)

# colnames(maindf)

#' trouver les répondants/ nonrépondants
#' --------------------------

# compter le nombre de réponses à partir de la 11è colonne
maindf$nrep <- sapply(1:nrow(maindf), function(i) sum(!is.na(maindf[i, -(1:10)])) )
maindf$repondant <- maindf$nrep > 0

#' Table du nombre de réponses et détection des nonrépondants
with(maindf, table(nrep))

#' données restreintes aux répondants?
repdf <- maindf[maindf$repondant == TRUE, ]

# graphe du nombre de réponses
p <- ggplot(repdf,aes(nrep) ) +
        geom_bar()
p

# essais??
# ggplot(repdf,aes(nrep) ) +
#         geom_bar()+ facet_grid(situation_situation ~ .)
#
# ggplot(repdf,aes(situation_situation, nrep) ) +
#         geom_boxplot(varwidth = TRUE, aes(group=1, fill = "ensemble")) +
#         geom_boxplot(varwidth = TRUE, aes(fill = "par situation")) +
#         geom_jitter(width = .5) +
#         coord_flip()


#' Sauvegardes des données prétraitées
#' ===================================

#' paramètres de sauvegarde

# second data directory
datadir2 <- "data2"
if (!dir.exists(datadir2)) {dir.create(datadir2)}

# files
maindffile <- "maindf.csv"
repdffile <- "repdf.csv"

# paths (cvs)
maindfpath <- file.path(".", datadir2, maindffile)
repdfpath <- file.path(".", datadir2, repdffile)

suspectdfpath <- file.path(".", datadir2, "suspectdf.csv")
verifdfpath <- file.path(".", datadir2, "verifdf.csv")
corrigdfpath <- file.path(".", datadir2, "corrigdf.csv")

# path(rda)
classmaindfpath <- file.path(".", datadir2, "classmaindf.Rda")


# vecteur des classes des colonnes des données principales
classmaindf <- lapply(maindf, FUN = function(col) class(col))
classmaindf <- unlist(classmaindf)


#'
#' sauvegarde en cvs
#' -----------------
#'

# enregistrement des données et des tables de correction et de vérification sous forme cvs
write.table(x = maindf, file = maindfpath, sep=";", row.names = FALSE)
write.table(x = repdf, file = repdfpath, sep=";", row.names = FALSE)

write.table(x = suspectdf, file = suspectdfpath, sep=";", row.names = FALSE)
write.table(x = verifdf, file = verifdfpath, sep=";", row.names = FALSE)
write.table(x = corrigdf, file = corrigdfpath, sep=";", row.names = FALSE)

# enregistrement des classes des colonnes des données principales (Rda)
save(classmaindf, file=classmaindfpath)


#'
#' Autre sauvegarde: enregistrer tout cela en .Rda
#' ------------------------------------------------
#'
# path(rda)
alldatapath <- file.path(".", datadir2, "alldata.Rda")

# enregistrement (Rda)
save( maindf,
      repdf,
      suspectdf,
      verifdf,
      corrigdf,
      classmaindf,
      file=alldatapath)


