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

#' Les Données principales
#' =======================

#' Envoyées par Daphné le 20/06, export total (avec colonnes dates).
#' sauvegardées dans le sous-répertoire 'data'

#'
#' Lecture
#' ----------


# dir(path = datadir)

datadir = "data"
fname1 <- "datajd0620.csv"
fpath1 <- file.path(".", datadir, fname1)
read.csv(fpath1, sep=";")


