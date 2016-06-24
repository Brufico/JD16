#' ---
#' title: "Enquête JD 2015 Acquisition et prétraitement des données"
#' subtitle: "Enquête JD part 1"
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



# nombre de diplomés
ndip <- nrow(maindf)

# colnames(maindf)

# trouver les nonrépondants
# nombre de réponses à partir de la 14è question
#
nrepvect <- sapply(1:nrow(maindf), function(i) sum(!is.na(maindf[i, -(1:13)])) )

#' Table du nombre de réponses et détection des nonrépondants
trep <- table(nrepvect)
prep <- trep/ndip

nrep <-  as.data.frame(nrepvect)
nrepv0 <- nrepvect[nrepvect > 0]
nrep0 <- as.data.frame(nrepv0)

# graphe du nombre de réponses
p <- ggplot(nrep0,aes(nrepv0) ) +
        geom_bar()
p


#' ### Colonnes sans réponses?
repcol <- sapply(maindf, function(col) sum(!is.na(col)))

#' génération liste variablex
lvar <- factor(paste0("*", colnames(maindf), "* (", repcol, ")"))
lvar

