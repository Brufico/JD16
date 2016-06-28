---
title: "Enquête Jeunes Diplômés 2015"
subtitle: Readme file
author: "Bruno Fischer Colonimos"
date: "22 juin 2016"
output: 
  html_document: 
    css: customex2.css
    number_sections: yes
    theme: readable
---

-------------------------------------------------------------

Résumé : 
=======================

Ce projet est le traitement de l'enquête jeunes diplômés 2015 (cad des diplomés dont la remise des deplômes a eu lieu le 27/05/2016

Répertoires : 
=============

Le répertoire de travail doit être le répertoire de l'enquête.

Arborescence des répertoires:

* workdir = répertoire principal de l'enquête

* répertoires de données
    - data 
      ~ répertoire de données initiales
    - data2
    ~ répertoire de données issues du prétraitement
    - Documents
    ~ documents initiaux: liste des questions d'enquête

* répertoires d'outils
    - tables de correspondance
    ~ toutes tables de correspondance

* répertoires de code
    - standardfunctions
    ~ code des "fonctions standard d'analyse"
    - addcode
    ~ code additionnel
    - rcode
    ~ code principal de l'enquête


Données
=======
Les données provenant de l'enquête datent du 20 juin.\
La liste des étudiants par filières date du 22 juin.\
Les deux listes sont fusionnées sous Excel, sauvegardées en csv et lues dans la dataframe `maindf`, avec des corrections.



Structure du questionnaire / dictionnaire des données
=====================================================

Voir le dictionnaire des données ( dans ./`codebook.md`) et le fichier des questions d'enquête  (./Documents/EJD PGE - Promotion 2015)


Structure du code
=================

Phase 1:
  ~ dir = data --> Script `Pretraitement.R` --> dir = data2

Phase 2:
  ~ dir = data --> Script `Depouillement.R` 

Phase 3:
  ~ document de sortie .Rmd fondé sur `Depouillement.R`



Eléments additionnels
=====================

Données initiales:
------------------

Stockées dans :

* Répertoire = "data"
* Nom fichier = "datajd0620+f.csv"


Données issues du prétraitement:
--------------------------------

`maindf`
~ Table de tous les diplômés

`repdf`
~ répondants uniquement

`classmaindf`
~ colClasses pour maindf et repdf (enregistré en .Rda uniquement)

`suspectdf`
~ cas suspects rémunérations

`verifdf`
~ cas suspects rémunérations à vérifier

`corrigdf`
  ~ cas suspects rémunérations corrections faites


Format: 2 formes d'enregistrement ont été simultanément réalisés: cvs et rda




