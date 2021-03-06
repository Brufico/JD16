#'---
#'title: Enquête JD 2015
#'subtitle: "Code: Depouillement question par question (DepouillementV2.R)"
#'author: "Bruno Fischer Colonimos"
#'date: 04 juillet 2016
#'output:
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
library(reshape2)
library(ggplot2)
library(knitr)

#+
knitr::opts_knit$set(root.dir = normalizePath("..")) # solves the dir problem for knitr



#'Sourcing more code
#'================
#'


#
#morecode
mcodir  <-  "addcode"
code1name <- "utils.R"
source(file.path(".",mcodir,code1name))

#morecode:standardfunctions
stdfundir <- "standardfunctions"
stdfunname <- "standardfunctionsV5.R"
source(file.path(".", stdfundir, stdfunname))

#'
#'Récupération des données prétraitées
#'====================================
#'

#path(rda)
datadir2 <- "data2"
alldatapath <- file.path(".", datadir2, "alldata.Rda")
#loading
whatload <- load(alldatapath)
#verification
#whatload


# verification (temp)
# maindf$votre_emploi_pays
# maindf$votre_emploi_zonegeo


#'
#'Fonctions pour le dépouillement question par question
#'===================================================
#'


#'générationdelalistedesopérationsaeffectuersurlesvariables (ne pas exécuter)
# unlist(lapply(colnames(maindf),function(x) {paste0("setresult(","'",x,"'",")" )}))


#'fonction pour enregistrerlesrésultats

#initialisation
allresults <- list(Whatsit="List of Results")

#functions
setresult <- function(rname,rres=res){
        allresults[[rname]] <<- rres
}

getresult <- function(rname){
        allresults[[rname]]
}


##essais:
#res <- 5
#setresult(iii)
#
#res <- 6
#setresult(jjj)
#==>sembleok

# récupérer les résultats



##essais:
# getresult("stg_fin_etude_proposition")
# str(allresults)

#'TAF Depouillement, début
#'===========

# not treated ----------
# setresult('Code')
# setresult('civilite')
# setresult('nom')
# setresult('prenom')

res <- cat1(dataf=maindf, nomfact="filiere", useNA = "no", orderfreq = FALSE)
setresult('filiere')

res <- cat1(dataf=maindf, nomfact="centre", useNA = "no", orderfreq = FALSE)
setresult('centre')

# setresult('pers_adresse')
# setresult('pers_telephone')
# setresult('pers_mobile')
# setresult('pers_email')


#' begin
#' ----------
#'
#' Le nombre des réponses
#' ----------------------
#'
res <- num1d(dataf=repdf, nomvar = "nrep", useNA = "no")
setresult('nrep')

#'
#'Le stage de fin d'études
#'-----------------------
#'
res <- cat1(dataf=repdf, nomfact="stg_fin_etude_proposition", useNA = "no", orderfreq = FALSE)
setresult('stg_fin_etude_proposition')

res <- cat1(dataf=repdf, nomfact="stg_fin_etude_accepte", useNA = "no", orderfreq = FALSE)
setresult('stg_fin_etude_accepte')

res <- verbatim(dataf=repdf, nomfact="stg_fin_etude_raison_refus", useNA = "no")
setresult('stg_fin_etude_raison_refus')


#'
#'L'alternance
#'-----------------------
#'

res <- cat1(dataf=repdf, nomfact="alternance_cursus", useNA = "no", orderfreq = FALSE)
setresult('alternance_cursus')

res <- cat1(dataf=repdf, nomfact="alternance_type", useNA = "no", orderfreq = FALSE)
setresult('alternance_type')

res <- cat1(dataf=repdf, nomfact="alternance_proposition", useNA = "no", orderfreq = FALSE)
setresult('alternance_proposition')

res <- cat1(dataf=repdf, nomfact="alternance_poursuivre", useNA = "no", orderfreq = FALSE)
setresult('alternance_poursuivre')

res <- cat1(dataf=repdf, nomfact="alternance_pas_proposition", useNA = "no", orderfreq = FALSE)
setresult('alternance_pas_proposition')

res <- cat1(dataf=repdf, nomfact="alternance_accepter", useNA = "no", orderfreq = FALSE)
setresult('alternance_accepter')

res <- cat1(dataf=repdf, nomfact="alternance_refus", useNA = "no", orderfreq = TRUE)
setresult('alternance_refus')


#'
#' Situation actuelle
#' ------------------

res <- cat1(dataf=repdf, nomfact="situation_situation", useNA = "no", orderfreq = FALSE)
setresult('situation_situation')


#' Situation sur le marché de l'emploi
#' ------------------------------------

res <- cat1(dataf=repdf, nomfact="situation_emploi", useNA = "no", orderfreq = FALSE)
setresult('situation_emploi')


#' ### taux d'emploi et filières (situation_emploi)

res <- cat2(emploidf, "filiere","situation_emploi",
            orderfreq1 =TRUE, ordervar1 = "situation_emploi" , orderval1 = "En activité professionnelle",
            orderfun1 = mean)
setresult('filieres_x_situation_emploi')


#' ### situation et filière (situation_situation)

res <- cat2(repdf, "filiere","situation_situation_short",
            orderfreq1 = TRUE, ordervar1 = "situation_situation_short" ,
            orderval1 = "activité pro.", orderfun1 = mean, orderfreq2 = FALSE)
setresult('filieres_x_situation_situation')



### Si Volontariat

res <- cat1(dataf=repdf, nomfact="situation_volontariat", useNA = "no", orderfreq = FALSE)
setresult('situation_volontariat')

res <- cat1(dataf=repdf, nomfact="situation_volontariat_type", useNA = "no", orderfreq = TRUE)
setresult('situation_volontariat_type')


### Si Création d'entreprise

res <- cat1(dataf=repdf, nomfact="situation_creation_activite", useNA = "no", orderfreq = FALSE)
setresult('situation_creation_activite')


### Si recherche d'emploi

res <- cat1(dataf=rechdf, nomfact="situation_recheche_depuis_ecole", useNA = "no", orderfreq = FALSE)
setresult('situation_recheche_depuis_ecole')

res <- cat1(dataf=rechdf, nomfact="situation_temps_recherce", useNA = "no", orderfreq = FALSE)
setresult('situation_temps_recherce')

res <- cat1(dataf=rechdf, nomfact="situation_refus_proposition", useNA = "no", orderfreq = FALSE)
setresult('situation_refus_proposition')

res <- num1d(dataf=rechdf, nomvar="situation_nombre_refus", useNA = "no")
setresult('situation_nombre_refus')

#-------------------------------------------------------------------------------------------
# N'existe pas seul Traitement particulier'
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('situation_difficultes')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('situation_difficultes_projet')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('situation_difficultes_mobilite')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('situation_difficultes_debouches')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('situation_difficultes_experience')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('situation_difficultes_competences')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('situation_difficultes_formation_pas_reconnue')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('situation_difficultes_formation_inadapte')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('situation_difficultes_salaire_insuffisant')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('situation_difficultes_autres')


# ==================================================================================== a revoir

# 28 traitement de la question à réponses multiples ordonnées

# variables <- colnames(rechdf)[grep("situation_difficultes_", colnames(maindf))]

raisons <- c("Difficultés à trouver des offres d'emploi correspondant au projet professionnel",
             "Mobilité géographique difficile",
             "Méconnaissance des débouchés possibles pour ma formation",
             "Manque d'expérience professionnelle",
             "Difficulté à mettre en valeur mes compétences",
             "Formation mal, ou pas reconnue par les employeurs",
             "Formation inadaptée au marché de l'emploi",
             "Salaire proposé insuffisant",
             "Autre difficulté non mentionnée dans la liste")


raisons_short <- c("offres d'emploi // projet pro",
                   "Mobilité géo. difficile",
                   "Débouchés pour ma formation?",
                   "Manque d'expérience pro.",
                   "Difficulté faire valoir compétences",
                   "Formation malreconnue par employeurs",
                   "Formation inadaptée  marché de l'emploi",
                   "Salaire insuffisant",
                   "Autre difficulté")



res <- mocat1(dataf = rechdf,
              prefix = "situation_difficultes_",
              valvect = raisons,
              valshort = raisons_short,
              valname = "Raison")
setresult("situation_difficultes")



#-----------------------------------------------------
res <- verbatim(maindf, nomfact="X_autre_details")
setresult('X_autre_details')

#-----------------------------------------------------



### Si En poursuite d'études

res <- cat1(dataf=repdf, nomfact="situation_type_etudes_short", useNA = "no", orderfreq = TRUE)
setresult('situation_type_etudes_short')

res <- verbatim2(dataf=repdf, nomfact="situation_etudes_etablissement", bynomfact = "filiere")
setresult('situation_etudes_etablissement')

res <- verbatim2(dataf=repdf,"situation_etudes_intitule", bynomfact = "situation_etudes_etablissement")
setresult('situation_etudes_intitule')

res <- cat1(dataf=repdf, nomfact="situation_etudes_alternance", useNA = "no", orderfreq = FALSE)
setresult('situation_etudes_alternance')

res <- cat1(dataf=repdf, nomfact="situation_etudes_raison_short", useNA = "no", orderfreq = TRUE)
setresult('situation_etudes_raison_short')



### Si En activité professionnelle

#### caractéristiques générales de l'emploi

res <- cat1(dataf=maindf, nomfact="emploi_actuel_premier_second", useNA = "no", orderfreq = FALSE)
setresult('emploi_actuel_premier_second')

res <- cat1(dataf=maindf, nomfact="emploi_actuel_type", orderfreq = TRUE)
setresult('emploi_actuel_type')

# idem avec réponse raccourcie
res <- cat1(dataf=maindf, nomfact="emploi_actuel_type_short", orderfreq = TRUE)
setresult('emploi_actuel_type_short')


# 'REM: Zéro répondants --------------------------------------------------------
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('emploi_actuel_statut')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('emploi_actuel_statut.1')
#
#
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('emploi_actuel_chef_entreprise')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('emploi_actuel_temps_recherche')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('emploi_actuel_temps_poste')
#
# Signalétique entreprise ---------------------------------------------
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# setresult('entreprise_nom')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('entreprise_adresse')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('entreprise_email_pro')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('entreprise_telephone')
# -----------------------------------------------------------------------------







#' Les diplômés en poste
#' ----------------------

### l'entreprise

res <- cat1(dataf=maindf, nomfact="entreprise_secteur", useNA = "no", orderfreq = TRUE)
setresult('entreprise_secteur')

# variable ajoutée: entreprise_secteur_letudiant
res <- cat1(dataf=maindf, nomfact="entreprise_secteur_letudiant", useNA = "no", orderfreq = TRUE)
setresult('entreprise_secteur_letudiant')

res <- cat1(dataf=maindf, nomfact="entreprise_secteur_principal", useNA = "no", orderfreq = FALSE)
setresult('entreprise_secteur_principal')

res <- cat1(dataf=maindf, nomfact="entreprise_taille", useNA = "no", orderfreq = FALSE)
setresult('entreprise_taille')


### L'emploi des diplômé en poste

#(localisation géographique **des diplômés en poste** : voir plus loin: international)


#### fonction

# questions ouvertes -----------------------------------------------------------
res <- verbatim(dataf=actidf, nomfact="votre_emploi_fonction")
# setresult('votre_emploi_fonction')

res <- cat1(dataf=actidf, nomfact="votre_emploi_activite", useNA = "no", orderfreq = TRUE)
setresult('votre_emploi_activite')

# recodage questions ouvertes --------------------------------------------------

res <- cat1(dataf=actidf, nomfact="votre_emploi_activite_standard_1",
            useNA = "no", orderfreq = TRUE, minperc = 2)
setresult('votre_emploi_activite_standard_1')

res <- cat1(dataf=actidf, nomfact="votre_emploi_activite_standard_2", useNA = "no", orderfreq = TRUE, minperc = 2)
setresult('votre_emploi_activite_standard_2')



##### le contrat
res <- cat1(dataf=actidf, nomfact="votre_emploi_type_contrat", useNA = "no", orderfreq = TRUE)
setresult('votre_emploi_type_contrat')

# non traitable
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_debut')

res <- num1d(dataf=actidf, nomvar = "votre_emploi_duree_cdd")
setresult('votre_emploi_duree_cdd')


#### Temps partiel?

res <- cat1(dataf=actidf, nomfact="votre_emploi_temps_partiel", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_temps_partiel')

res <- cat1(dataf=actidf, nomfact="votre_emploi_temps_partiel_subi", dotest = FALSE, orderfreq = FALSE)
setresult('votre_emploi_temps_partiel_subi')

# Non traitable (2 réponses)
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_part_temps_partiel')


#### Statut et responsabilité

res <- cat1(dataf=maindf, nomfact="votre_emploi_statut_cadre", useNA = "no", orderfreq = TRUE)
setresult('votre_emploi_statut_cadre')

res <- cat1(dataf=actidf, nomfact="votre_emploi_personnes_responsable", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_personnes_responsable')

# n'existe pas seul
# res <- cat1(dataf=maindf, nomfact="votre_emploi_responsabilite", useNA = "no", orderfreq = FALSE)
# setresult('votre_emploi_responsabilite')

res <- cat1(dataf=actidf, nomfact="votre_emploi_responsabilite_budget", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_responsabilite_budget')

res <- cat1(dataf=actidf, nomfact="votre_emploi_responsabilite_projet", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_responsabilite_projet')

res <- cat1(dataf=actidf, nomfact="votre_emploi_responsabilite_equipe", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_responsabilite_equipe')



#### La situation géographique

res <- cat1(dataf=actidf,
            nomfact="france_etranger", useNA = "no", orderfreq = TRUE)
setresult('france_etranger')

res <- cat1(dataf=actidf, nomfact="votre_emploi_zonegeo", useNA = "no", orderfreq = TRUE, minperc = 1)
setresult('votre_emploi_zonegeo')

res <- cat1(dataf=actidf, nomfact="votre_emploi_pays", useNA = "no", orderfreq = TRUE, minperc = 1)
setresult('votre_emploi_pays')



#### Les langues et l'international

# NEPS
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_langues')

res <- cat1(dataf=actidf, nomfact="votre_emploi_langues_francais", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_langues_francais')

res <- cat1(dataf=actidf, nomfact="votre_emploi_langues_anglais", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_langues_anglais')

res <- cat1(dataf=actidf, nomfact="votre_emploi_langues_allemand", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_langues_allemand')

res <- cat1(dataf=actidf, nomfact="votre_emploi_langues_espagnol", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_langues_espagnol')

res <- verbatim2(dataf=actidf, nomfact="votre_emploi_langues_autres", bynomfact ="filiere")
setresult('votre_emploi_langues_autres')

res <- cat1(dataf=actidf, nomfact="votre_emploi_fonction_international", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_fonction_international')


#### autres caractéristiques de l'emploi

res <- num1d(dataf=actidf, nomvar = "votre_emploi_developpement_durable", useNA = "no")
setresult('votre_emploi_developpement_durable')

res <- cat1(dataf=actidf, nomfact="votre_emploi_consultant", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_consultant')


#'
#' La rémunération des diplômés en poste
#' -------------------------------------

# --------------------------------------------------------------------------
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_remuneration_brut')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_remuneration_variable')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_avantage_nature')
# --------------------------------------------------------------------------


res <- num1c(dataf=actidf, nomvar = "votre_emploi_remuneration_brut", # part fixe de la rémunération
             breaks=seq(14000,100000, by = 4000), closed="left")
setresult('votre_emploi_remuneration_brut')

res <- num1c(dataf=actidf, nomvar = "votre_emploi_remuneration_total",
             breaks=seq(14000,100000, by = 4000), closed="left")
setresult('votre_emploi_remuneration_total')

res <- num1c(dataf=actidf, nomvar="votre_emploi_remuneration_part_variable",
             breaks=seq(0,40, by=5), closed="left")
setresult('votre_emploi_remuneration_part_variable')

# (total rémunération = calculée, part variable = ajoutée)



#'
#' La rémunération et la situation géographique du poste
#' -----------------------------------------------------
#'


#' ### Rémunération totale (brute) en fonction de la situation géographique

res <- catnum1c(actidf, "france_etranger", "votre_emploi_remuneration_total",
                labelall = "Ensemble", labelgroups = "Par situation")
setresult('votre_emploi_remuneration_total_x_france_etranger')


res <- catnum1c(actidf, "votre_emploi_zonegeo", "votre_emploi_remuneration_total",
                labelall = "Ensemble", labelgroups = "Par situation")
setresult('votre_emploi_remuneration_total_x_votre_emploi_zonegeo')




#' ### Rémunération totale fixe (brute) hoirs prime et commissions, en fonction de la situation géographique
res <- catnum1c(actidf, "france_etranger", "votre_emploi_remuneration_brut",
                labelall = "Ensemble", labelgroups = "Par situation")
setresult('votre_emploi_remuneration_brut_x_france_etranger')


res <- catnum1c(actidf, "votre_emploi_zonegeo", "votre_emploi_remuneration_brut",
                labelall = "Ensemble", labelgroups = "Par situation")
setresult('votre_emploi_remuneration_brut_x_votre_emploi_zonegeo')




#'
#' La rémunération et la filière de spécialisation
#' -----------------------------------------------
#'
res <- catnum1c(actidf, "filiere", "votre_emploi_remuneration_total",
                labelall = "Ensemble", labelgroups = "Par filière")
setresult('votre_emploi_remuneration_total_x_filiere')



#'
#' La recherche de l'emploi des diplômés en poste
#' ----------------------------------------------
#'

res <- num1d(dataf=actidf, nomvar = "votre_emploi_temps_recherche", useNA = "no")
setresult('votre_emploi_temps_recherche')

res <- cat1(dataf=actidf, nomfact="votre_emploi_comment_trouver", useNA = "no", orderfreq = TRUE)
setresult('votre_emploi_comment_trouver')

res <- verbatim(dataf=actidf, nomfact="votre_emploi_site_recherche")
setresult('votre_emploi_site_recherche')



#'
#' L'appréciation du poste des diplômés en activité professionnelle
#' ------------------------------------------------------------------
#'


res <- cat1(dataf=actidf, nomfact="votre_emploi_principal_critere", useNA = "no", orderfreq = TRUE)
setresult('votre_emploi_principal_critere')

# NEPS
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_correspond')

res <- cat1(dataf=actidf, nomfact="votre_emploi_correspond_qualification", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_correspond_qualification')

res <- cat1(dataf=actidf, nomfact="votre_emploi_correspond_secteur", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_correspond_secteur')

res <- num1d(dataf=actidf, nomvar="votre_emploi_satisfaction", useNA = "no")
setresult('votre_emploi_satisfaction')

# res <- num1d(dataf=actidf, nomvar="votre_emploi_note", useNA = "no")
# setresult('votre_emploi_note')

res <- num1d(dataf=actidf, nomvar="votre_emploi_note_conditions_travail", useNA = "no")
setresult('votre_emploi_note_conditions_travail')

res <- num1d(dataf=actidf, nomvar="votre_emploi_note_relations_collegues", useNA = "no")
setresult('votre_emploi_note_relations_collegues')

res <- num1d(dataf=maindf, nomvar="votre_emploi_note_relations_hierarchie", useNA = "no")
setresult('votre_emploi_note_relations_hierarchie')

res <- num1d(dataf=actidf, nomvar="votre_emploi_note_remuneration", useNA = "no")
setresult('votre_emploi_note_remuneration')

# setresult('pour_finir_complements_information')
# setresult('pour_finir_jpo_titre')
# setresult('pour_finir_jpo')


#'
#' L'opinion des diplômés sur certains éléments de leur formation
#' ==============================================================
#'

res <- verbatim2(dataf=actidf, nomfact="pour_finir_enseignement", bynomfact="filiere")
setresult('pour_finir_enseignement')

res <- verbatim2(dataf=actidf, nomfact="pour_finir_enseignement_recus", bynomfact="filiere")
setresult('pour_finir_enseignement_recus')

res <- verbatim2(dataf=actidf, nomfact="pour_finir_enseignements_absents", bynomfact="filiere")
setresult('pour_finir_enseignements_absents')



# res <- verbatim2(dataf=maindf, nomfact="pour_finir_enseignement", bynomfact="filiere")
# setresult('pour_finir_coordonnees_personnelles_titre')
#
# res <- verbatim2(dataf=maindf, nomfact="pour_finir_enseignement", bynomfact="filiere")
# setresult('pour_finir_coordonnees_personnelles')
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# setresult('votre_emploi_langues_francais_lik')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# setresult('votre_emploi_langues_anglais_lik')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# setresult('votre_emploi_langues_allemand_lik')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# setresult('votre_emploi_langues_espagnol_lik')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# setresult('entreprise_secteur_letudiant')



# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# setresult('nrep')
#
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# setresult('repondant')


# saving results in .Rda format
# destination file
destfile <- "allresults.Rda"
destdir <- "data3"
destpath <- file.path(destdir, destfile)

if (!dir.exists(destdir)) {dir.create(destdir)}
if (! file.exists(destpath)) {file.create(destpath)}

#' saving
save(allresults, file=destpath)







