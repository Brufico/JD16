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
        toc: yes
pdf_document:
        toc: yes
word_document: default
---

-------------------------------------------------------------

Résumé : 
=======================

Ce projet est le traitement de l'enquête jeunes diplômés 2015 (cad des diplomés dont la remise des deplômes a eu lieu le 27/05 20)



Données
=======
Les données provenant de l'enquête datent du 20 juin
La liste des filières date du 22
Les deux listes sont fusionnées sous Excel, sauvées en csv et lues dans la dataframe maindf, avec des corrections.



Structure du questionnaire / dictionnaire
=========================================

Le questionnaire d'enquête est organisées en parties:

* POUR COMMENCER (signalétique)
* COORDONNEES PERSONNELLES (signalétique)

* SUR VOTRE STAGE DE FIN D'ETUDES
    * proposition d'embauche en fin de stage ? s*tg_fin_etude_proposition* (182)
    * accepte? *stg_fin_etude_accepte* (83)
* Eléments ajoutés
    * *filiere* (341)
    * *centre* (341)

* SUR L'ENTREPRISE QUI VOUS A ACCUEILLI EN ALTERNANCE
    * alternance à l'Ipag (o/N)  *alternance_cursus* (202)
    * proposition d'embauche ? *alternance_proposition* (121)

* SITUATION ACTUELLE
    * 20 Statut: *situation_situation*
        - En activité professionnelle (y compris volontariat)
        - En création d'entreprise
        - En recherche d'emploi
        - En poursuite d'études (hors thèse)
        - Sans activité volontairement
    * Si activité pro. 21 êtes_vous volontaire (VIE, VIA) ? (O/N) *situation_volontariat*
    * si création Ent, 
        - 23 L'entreprise st-elle déjà en activité (O/N) (si O ==> en activité professionnelle) *situation_creation_activite*
    * Si recherche d'emploi, 
        - 24 Etes-vous à la recherche d'un emploi depuis la sortie de l'école ? *situation_recheche_depuis_ecole*
        - Depuis combien de temps ? *situation_temps_recherce*
        - Avez-vous refusé 1+ propositions d'emploi, *situation_refus_proposition*
        - combien? *situation_nombre_refus* (12)
    * Si poursuite d'études
        - ?? (QOuvertes)
        - Type d'études (QF) *situation_type_etudes* (14)
        - Pourquoi ? (QF) *situation_etudes_raison* (17)
        
* PREMIERES QUESTIONS SUR VOTRE EMPLOI ACTUEL (q37+)
    * emploi n° *emploi_actuel_premier_second* 
        - 1
        - 2+
    * 38 type emploi *emploi_actuel_type*
        - Salarié(e) d'une entreprise privée
        - Salarié(e) de l'Etat 
        - Salarié(e) d'une collectivité territoriale, d'une entreprise publique ou d'une structure associative
        - Non salarié(e) : chef d'entreprise, profession libérale, travailleur(e) indépendant(e)
    * si collectivité territoriale: statut= *emploi_actuel_statut*
        - Fonctionnaire
        - Agent contractuel
    * si non-salarié: statut= *emploi_actuel_statut.1*
        - Le créateur 
        - Le repreneur
    * 41 Combien de temps avez-vous mis pour trouver cet emploi? *emploi_actuel_temps_recherche* (0)
        - Contrat avant la sortie de l'école
        - Moins de 2 mois de recherche
        - De 2 à moins de 4 mois
        - De 4 à moins de 6 mois
        - 6 mois ou plus
    * *emploi_actuel_temps_poste*  (0)

* INFORMATIONS SUR VOTRE ENTREPRISE
    * signalétique()
    * secteur d'activité *entreprise_secteur*
       - 27 secteurs !!!
    * SI etudes_conseil, secteur d'intervention principal *entreprise_secteur_principal*
    * 52 Taille de l'entreprise
        - 10 classes
* INFORMATIONS SUR VOTRE EMPLOI
* POUR FINIR ...


Prétraitement des données
=========================
