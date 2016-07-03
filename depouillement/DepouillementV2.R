#'---
#'title: Enquête JD 2015
#'subtitle: "Code:Depouillementquestionparquestion"
#'author: "Bruno Fischer Colonimos"
#'date: 27 juin 2016
#'output:
#'  html_document:
#'    css:customex2.css
#'    number_sections:yes
#'    theme:readable
#'    toc:yes
#'  pdf_document:
#'    toc: yes
#'  word_document:default
#'---
#'

#' Loading packages
#' ================

library(dplyr)
library(ggplot2)


#'Sourcing more code
#'================
#'
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
res <- cat1(dataf=maindf, nomfact="stg_fin_etude_proposition", useNA = "no", orderfreq = FALSE)
setresult('stg_fin_etude_proposition')

res <- cat1(dataf=maindf, nomfact="stg_fin_etude_accepte", useNA = "no", orderfreq = FALSE)
setresult('stg_fin_etude_accepte')

res <- verbatim(dataf=maindf, nomfact="stg_fin_etude_raison_refus", useNA = "no")
setresult('stg_fin_etude_raison_refus')


#'
#'L'alternance
#'-----------------------
#'

res <- cat1(dataf=maindf, nomfact="alternance_cursus", useNA = "no", orderfreq = FALSE)
setresult('alternance_cursus')

res <- cat1(dataf=maindf, nomfact="alternance_type", useNA = "no", orderfreq = FALSE)
setresult('alternance_type')

res <- cat1(dataf=maindf, nomfact="alternance_proposition", useNA = "no", orderfreq = FALSE)
setresult('alternance_proposition')

res <- cat1(dataf=maindf, nomfact="alternance_poursuivre", useNA = "no", orderfreq = FALSE)
setresult('alternance_poursuivre')

res <- cat1(dataf=maindf, nomfact="alternance_pas_proposition", useNA = "no", orderfreq = FALSE)
setresult('alternance_pas_proposition')

res <- cat1(dataf=maindf, nomfact="alternance_accepter", useNA = "no", orderfreq = FALSE)
setresult('alternance_accepter')

res <- cat1(dataf=maindf, nomfact="alternance_refus", useNA = "no", orderfreq = TRUE)
setresult('alternance_refus')


#'
#' Situation actuelle
#' ------------------

res <- cat1(dataf=maindf, nomfact="situation_situation", useNA = "no", orderfreq = FALSE)
setresult('situation_situation')


#' Situation sur le marché de l'emploi
#' ------------------------------------

res <- cat1(dataf=maindf, nomfact="situation_emploi", useNA = "no", orderfreq = FALSE)
setresult('situation_emploi')


### Si Volontariat

res <- cat1(dataf=maindf, nomfact="situation_volontariat", useNA = "no", orderfreq = FALSE)
setresult('situation_volontariat')

res <- cat1(dataf=maindf, nomfact="situation_volontariat_type", useNA = "no", orderfreq = FALSE)
setresult('situation_volontariat_type')


### Si Création d'entreprise

res <- cat1(dataf=maindf, nomfact="situation_creation_activite", useNA = "no", orderfreq = FALSE)
setresult('situation_creation_activite')


### Si recherche d'emploi

res <- cat1(dataf=maindf, nomfact="situation_recheche_depuis_ecole", useNA = "no", orderfreq = FALSE)
setresult('situation_recheche_depuis_ecole')

res <- cat1(dataf=maindf, nomfact="situation_temps_recherce", useNA = "no", orderfreq = FALSE, )
setresult('situation_temps_recherce')

res <- cat1(dataf=maindf, nomfact="situation_refus_proposition", useNA = "no", orderfreq = FALSE)
setresult('situation_refus_proposition')

res <- num1d(dataf=maindf, nomvar="situation_nombre_refus", useNA = "no")
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

# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# setresult('X_autre_details')

#-------------------------------------------------------------------------------------------




### Si En poursuite d'études

res <- cat1(dataf=maindf, nomfact="situation_type_etudes_short", useNA = "no", orderfreq = TRUE)
setresult('situation_type_etudes_short')

res <- verbatim2(dataf=maindf, nomfact="situation_etudes_etablissement", bynomfact = "filiere")
setresult('situation_etudes_etablissement')

res <- verbatim2(dataf=maindf,"situation_etudes_intitule", bynomfact = "situation_etudes_etablissement")
setresult('situation_etudes_intitule')

res <- cat1(dataf=maindf, nomfact="situation_etudes_alternance", useNA = "no", orderfreq = FALSE)
setresult('situation_etudes_alternance')

res <- cat1(dataf=maindf, nomfact="situation_etudes_raison_short", useNA = "no", orderfreq = TRUE)
setresult('situation_etudes_raison_short')



### Si En activité professionnelle

#### caractériqtiques générales de l'emploi

res <- cat1(dataf=maindf, nomfact="emploi_actuel_premier_second", useNA = "no", orderfreq = FALSE)
setresult('emploi_actuel_premier_second')

res <- cat1(dataf=maindf, nomfact="emploi_actuel_type", orderfreq = TRUE)
setresult('emploi_actuel_type')

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


### L'emploi

#### fonction

res <- verbatim(dataf=maindf, nomfact="votre_emploi_fonction")
# setresult('votre_emploi_fonction')

res <- cat1(dataf=maindf, nomfact="votre_emploi_activite", useNA = "no", orderfreq = TRUE)
setresult('votre_emploi_activite')

##### le contrat
res <- cat1(dataf=maindf, nomfact="votre_emploi_type_contrat", useNA = "no", orderfreq = TRUE)
setresult('votre_emploi_type_contrat')

# non traitable
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_debut')

res <- num1d(dataf=maindf, nomvar = "votre_emploi_duree_cdd")
setresult('votre_emploi_duree_cdd')


#### Temps partiel?

res <- cat1(dataf=maindf, nomfact="votre_emploi_temps_partiel", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_temps_partiel')

res <- cat1(dataf=maindf, nomfact="votre_emploi_temps_partiel_subi", dotest = FALSE, orderfreq = FALSE)
setresult('votre_emploi_temps_partiel_subi')

# Non traitable (2 réponses)
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_part_temps_partiel')


#### Statut et responsabilité

res <- cat1(dataf=maindf, nomfact="votre_emploi_statut_cadre", useNA = "no", orderfreq = TRUE)
setresult('votre_emploi_statut_cadre')

res <- cat1(dataf=maindf, nomfact="votre_emploi_personnes_responsable", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_personnes_responsable')

# n'existe pas seul
# res <- cat1(dataf=maindf, nomfact="votre_emploi_responsabilite", useNA = "no", orderfreq = FALSE)
# setresult('votre_emploi_responsabilite')

res <- cat1(dataf=maindf, nomfact="votre_emploi_responsabilite_budget", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_responsabilite_budget')

res <- cat1(dataf=maindf, nomfact="votre_emploi_responsabilite_projet", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_responsabilite_projet')

res <- cat1(dataf=maindf, nomfact="votre_emploi_responsabilite_equipe", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_responsabilite_equipe')


#### Les langues et l'international

# NEPS
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_langues')

res <- cat1(dataf=maindf, nomfact="votre_emploi_langues_francais", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_langues_francais')

res <- cat1(dataf=maindf, nomfact="votre_emploi_langues_anglais", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_langues_anglais')

res <- cat1(dataf=maindf, nomfact="votre_emploi_langues_allemand", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_langues_allemand')

res <- cat1(dataf=maindf, nomfact="votre_emploi_langues_espagnol", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_langues_espagnol')

res <- verbatim2(dataf=maindf, nomfact="votre_emploi_langues_autres", bynomfact ="filiere")
setresult('votre_emploi_langues_autres')

res <- cat1(dataf=maindf, nomfact="votre_emploi_fonction_international", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_fonction_international')


#### autres caractéristiques de l'emploi

res <- num1d(dataf=maindf, nomvar = "votre_emploi_developpement_durable", useNA = "no")
setresult('votre_emploi_developpement_durable')

res <- cat1(dataf=maindf, nomfact="votre_emploi_consultant", useNA = "no", orderfreq = FALSE)
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




res <- num1c(dataf=repdf, nomvar = "votre_emploi_remuneration_total",
             breaks=seq(14000,100000, by = 4000), closed="left")
setresult('votre_emploi_remuneration_total')

res <- num1c(dataf=repdf, nomvar="votre_emploi_remuneration_part_variable",
             breaks=seq(0,40, by=5), closed="left")
setresult('votre_emploi_remuneration_part_variable')

# (part variable ajoutée)



#'
#' La recherche de l'emploi des diplômés en poste
#' ----------------------------------------------
#'


res <- num1d(dataf=maindf, nomvar = "votre_emploi_temps_recherche", useNA = "no")
setresult('votre_emploi_temps_recherche')

res <- cat1(dataf=maindf, nomfact="votre_emploi_comment_trouver", useNA = "no", orderfreq = TRUE)
setresult('votre_emploi_comment_trouver')

res <- verbatim(dataf=maindf, nomfact="votre_emploi_site_recherche")
setresult('votre_emploi_site_recherche')



#'
#' L'appréciation du poste des diplômés en activité professionnelle
#' ------------------------------------------------------------------
#'


res <- cat1(dataf=maindf, nomfact="votre_emploi_principal_critere", useNA = "no", orderfreq = TRUE)
setresult('votre_emploi_principal_critere')

# NEPS
# res <- cat1(dataf=maindf, nomfact="xxxx", useNA = "no", orderfreq = FALSE)
# # setresult('votre_emploi_correspond')

res <- cat1(dataf=maindf, nomfact="votre_emploi_correspond_qualification", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_correspond_qualification')

res <- cat1(dataf=maindf, nomfact="votre_emploi_correspond_secteur", useNA = "no", orderfreq = FALSE)
setresult('votre_emploi_correspond_secteur')

res <- num1d(dataf=maindf, nomvar="votre_emploi_satisfaction", useNA = "no")
setresult('votre_emploi_satisfaction')

# res <- num1d(dataf=maindf, nomvar="votre_emploi_note", useNA = "no")
# setresult('votre_emploi_note')

res <- num1d(dataf=maindf, nomvar="votre_emploi_note_conditions_travail", useNA = "no")
setresult('votre_emploi_note_conditions_travail')

res <- num1d(dataf=maindf, nomvar="votre_emploi_note_relations_collegues", useNA = "no")
setresult('votre_emploi_note_relations_collegues')

res <- num1d(dataf=maindf, nomvar="votre_emploi_note_relations_hierarchie", useNA = "no")
setresult('votre_emploi_note_relations_hierarchie')

res <- num1d(dataf=maindf, nomvar="votre_emploi_note_remuneration", useNA = "no")
setresult('votre_emploi_note_remuneration')

# setresult('pour_finir_complements_information')
# setresult('pour_finir_jpo_titre')
# setresult('pour_finir_jpo')


#'
#' L'opinion des diplômés sur certains éléments de leur formation
#' ==============================================================
#'

res <- verbatim2(dataf=maindf, nomfact="pour_finir_enseignement", bynomfact="filiere")
setresult('pour_finir_enseignement')

res <- verbatim2(dataf=maindf, nomfact="pour_finir_enseignement_recus", bynomfact="filiere")
setresult('pour_finir_enseignement_recus')

res <- verbatim2(dataf=maindf, nomfact="pour_finir_enseignements_absents", bynomfact="filiere")
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







