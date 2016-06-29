#'---
#'title: "Standard Functions for Basic Statistical Analysis"
#'subtitle: Additional R code in morestdfunctions.R
#'author: "Bruno Fischer Colonimos"
#'date: "28 juin 2016"
#'abstract: |
#'      More functions
#'output:
#'  html_document:
#'    number_sections: yes
#'    toc: yes
#'    theme: readable
#'    css: customex2.css
#'  word_document: default
#'  pdf_document:
#'    toc: yes
#'---

#'


#+ init, include=FALSE
library(knitr)
# opts_chunk$set(results="hide")

library(ggplot2)
library(dplyr)

#'
#' Récupération des données prétraitées
#' ====================================
#'

# path(rda)
maindir <- "C:/Users/Bruno/Documents/R/Enquetejd16"
datadir2 <- "data2"
alldatapath <- file.path(maindir, datadir2, "alldata.Rda")
# loading
whatload <- load(alldatapath)
# verification
# whatload




#' nouveau code
#' ============

# getwd()
source(file.path("standardfunctions","standardfunctionsV4.R"))


numc <- length(unique(nonavect(repdf$stg_fin_etude_raison_refus)))

ptable <- repdf %>%
        filter(!is.na(stg_fin_etude_raison_refus)) %>%
        select(stg_fin_etude_raison_refus)
colnames(ptable) <- "Raisons du refus"
ptable


# function
# --------


verbatim <- function(dataf, nomfact, useNA = "no"){
        dataf <- if (useNA == "no") {
                dataf[which(!is.na(dataf[[nomfact]])), ]
        } else {
                dataf
        }
        ptable <- as.data.frame(dataf[[nomfact]])
        colnames(ptable) <- "Verbatim"
        ptable
}


verbatim(repdf,"stg_fin_etude_raison_refus")


# with condition
#=================


ptable <- repdf %>%
        filter(!is.na(stg_fin_etude_raison_refus)) %>%
        select(stg_fin_etude_raison_refus)
colnames(ptable) <- "Raisons du refus"
ptable

















verbatim2 <- function(dataf, nomfact, bynomfact,  useNA = "no"){
        dataf <- if (useNA == "no") {
                dataf[which(!is.na(dataf[[nomfact]])), ]
        } else {
                dataf
        }
        ptable <- as.data.frame(dataf[order(dataf[[bynomfact]]), c(bynomfact, nomfact)])
        colnames(ptable) <- c( bynomfact, "Verbatim")
        ptable
}

pt <- verbatim2(repdf,"stg_fin_etude_raison_refus", "filiere")




ptable <- repdf[!is.na(repdf[["stg_fin_etude_raison_refus"]]), ]
ptable <- ptable[ , c("filiere" ,"stg_fin_etude_raison_refus" )]
ptable[order(ptable[["filiere"]]), ]

