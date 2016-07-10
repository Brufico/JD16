---
title: "Enquête Jeunes Diplômés 2015"
author: "Bruno Fischer Colonimos"
date: "26 juin 2016"
output:
  pdf_document:
    number_sections: yes
    toc: yes
  html_document:
    css: customex2.css
    number_sections: yes
    theme: readable
    toc: yes
subtitle: Codebook
---

-------------------------------------------------------------


Principes: Structure du questionnaire et correspondance avec les variables 
=========================================================================

Ce document présente un dictionnaire des données, en les faisant correspondre aux questions de l'enquête
Les variables sont présentées dans l'ordre des questions dans l'enquête.\
Généralement, cet ordre correspond à l'ordre des colonnes de la table des données.\
Il se peut que certaines questions non susceptibles d'une exploitation dans l'enquête (Questions ouvertes texte) ne soient pas listées. Les variables ajoutées sont signalées.\
Il se peut que les questions ayant recueilli très peu de réponses ne soient pas traitées.


Format des entrées :
--------------------

PARTIE DU QUESTIONNAIRE

**SI** *condition* (si besoin, sion rien) >

* texte de la question? *nom_variable* (nombre de répondants) **[type]** (REM: remarque)
    - réponse1
    - réponse2
    - ...

**FINSI** (si besoin)


Nomenclature des types de questions/variables/traitement
--------------------------------------------------------

* '**[num]**: quanti
* '**[ord]**: ordinale ==> facteur ordonné
* '**[lik]** : ordinale ==> echelle de Likert
* '**[cat]**: quali
* '**[Mcat]**: quali, réponses multiples
* '**[Mocat]**: quali, réponses multiples ordonnées
* '**[V]** : ouverte, verbatim




Structure du questionnaire, variables: Liste structurée
======================================================================


POUR COMMENCER (signalétique)
-----------------------------

* *Code* (344)
* *civilite* (344) **[cat]**

Eléments ajoutés
----------------

* *filiere* (341) **[cat]**
* *centre* (341) **[cat]**

**TAF** ==> ajouter Variable *pole* + variable *filiere_avec_masteres* + variable *filiere_masters_groupes*


COORDONNEES PERSONNELLES (signalétique)
-----------------------------------------


SUR VOTRE STAGE DE FIN D'ETUDES
---------------------------------
* 10 Avez-vous reçu une proposition d’embauche de votre entreprise d'accueil? *stg_fin_etude_proposition* (182) **[cat]**
    - Oui
    - Non

* 11 Avez-vous accepté cette proposition ? *stg_fin_etude_accepte* (83) **[cat]**
    - Oui
    - Non

* 12 Pour quelle(s) raison(s) avez-vous refusé cette proposition ? *stg_fin_etude_raison_refus* (29) **[V]** 


SUR L'ENTREPRISE QUI VOUS A ACCUEILLI EN ALTERNANCE
---------------------------------------------------

* 13 Avez-vous suivi un cursus en alternance à l’IPAG ?  *alternance_cursus* (202) **[cat]**
    - Oui
    - Non
* 14 Dans le cadre de cette alternance, quel type de contrat avez-vous signé ? *alternance_type* (123) **[cat]**
    - Contrat d’apprentissage
    - Contrat de professionnalisation

* 15 Avez-vous reçu une proposition d'embauche de la part de l'entreprise, à la fin de votre contrat en alternance ? *alternance_proposition* (121) **[cat]**
    - Oui
    - Non

**SI** *alternance_proposition* == Oui

* 16 Est-ce pour poursuivre la mission sur laquelle vous avez travaillé pendant votre alternance ? *alternance_poursuivre* (66) **[cat]**
    - Oui
    - Non
    - Autre

**SI** *alternance_proposition* == Non

* 17 Si vous n'avez pas eu de proposition d'embauche, savez-vous pour quelle(s) raison(s) ? *alternance_pas_proposition* (50) ~~[Mcat]~~ **[cat]** (REM a été codée comme réponse unique) 
    - L'entreprise n'embauche pas actuellement
    - L'entreprise ne considère pas l’alternance comme une pré-embauche
    - La mission est terminée
    - Autre

**SI** *alternance_proposition* == Oui

* 18 Avez-vous accepté cette proposition ? *alternance_accepter* (66) **[cat]**
    - Oui
    - Non

**SI** *alternance_proposition* == Oui ET *alternance_accepter* == Non

* 19 Pour quelle(s) raison(s) avez-vous refusé cette proposition ?  *alternance_refus* (24) ~~[Mcat]~~ **[cat]** (REM a été codée comme réponse unique) 
    - Rémunération insuffisante
    - Manque d'intérêt de la mission proposée
    - Volonté de changer d'environnement
    - Meilleure proposition dans une autre entreprise
    - Absence de perspectives d'évolution
    - Autre

~~**TAF** ==> ajouter variables binaires pour représenter 19 (**[Mcat]**)
    * *alternance_refus_remuneration*
    * *alternance_refus_mission*
    * *alternance_refus_changer*
    * *alternance_refus_meilleurepro*
    * *alternance_refus_autre*~~

SITUATION ACTUELLE
--------------------

* 20 Votre situation actuelle *situation_situation* (219) **[cat]**
    - En activité professionnelle (y compris volontariat)
    - En création d'entreprise
    - En recherche d'emploi
    - En poursuite d'études (hors thèse)
    - Sans activité volontairement

**SI** *situation_situation* == En activité professionnelle 

* 21 êtes_vous volontaire (VIE, VIA) ? *situation_volontariat* (148) **[cat]**
    - Oui
    - Non

**SI** *situation_volontariat* == Oui

* 22 De quel type de volontariat s'agit-il ? *situation_volontariat_type* (7) **[cat]**
    - Volontariat International en Entreprise
    - Volontariat International en Administration
    - Volontariat de Solidarité Internationale
    - Volontariat Civil
    - Autre


**Si** *situation_situation* == création Ent, 

* 23 L'entreprise st-elle déjà en activité ? *situation_creation_activite* (12) **[cat]** (REM si O ==> en activité professionnelle)
    - Oui
    - Non

**Si** *situation_situation* == recherche d'emploi

* 24 Etes-vous à la recherche d'un emploi depuis la sortie de l'école ? *situation_recheche_depuis_ecole* (40) **[cat]** (REM coquille)
    - Oui
    - Non
* 25 Depuis combien de temps êtes-vous à la recherche d'un emploi ? *situation_temps_recherce* (41) **[ord]** (REM coquille)
    - Depuis moins de 2 mois
    - 2 mois à moins de 4 mois
    - 4 mois à moins de 6 mois
    - 6 mois et plus

* 26 Avez-vous refusé une ou plusieurs propositions d'emploi depuis ?  *situation_refus_proposition* (40) **[cat]**
    - Oui
    - Non

* 27 Combien de propositions d'emploi avez-vous refusé ?  *situation_nombre_refus* (12) **[num]**

* 28 Quelles difficultés rencontrez-vous dans votre recherche d'emploi ? *voir variables ci-après* **[Mocat]**
    - Difficultés à trouver des offres d'emploi correspondant au projet professionnel
    - Mobilité géographique difficile
    - Méconnaissance des débouchés possibles pour ma formation
    - Manque d'expérience professionnelle
    - Difficulté à mettre en valeur mes compétences
    - Formation mal, ou pas reconnue par les employeurs
    - Formation inadaptée au marché de l'emploi
    - Salaire proposé insuffisant
    - Autre difficulté non mentionnée dans la liste


variables\
*situation_difficultes_projet* (34) **[num]**                  
*situation_difficultes_mobilite* (13) **[num]**               
*situation_difficultes_debouches* (17) **[num]**              
*situation_difficultes_experience* (35) **[num]**             
*situation_difficultes_competences* (18) **[num]**             
*situation_difficultes_formation_pas_reconnue* (12) **[num]**\
*situation_difficultes_formation_inadapte* (11) **[num]**\
*situation_difficultes_salaire_insuffisant* (18) **[num]**\
*situation_difficultes_autres* (7) **[num]**     

**SI** situation_difficultes_autres != NA

* 29-31 Précisez: *X_autre_details* (4) **[V]** (REM une seule variable)


**Si** *situation_situation* == poursuite d'études

* 32 Quel type d'études poursuivez-vous ? *situation_type_etudes* (14) **[cat]**
    - Mastère spécialisé (MS) accrédité par la CGE - Conférence des Grandes Ecoles
    - Mastère en science (MSc) de la CGE - Conférence des Grandes Ecoles
    - Master universitaire
    - Master of Science (MSc)
    - Master of Business Administration (MBA)
    - Préparation d'un concours
    - Autre

* 33 Dans quel établissement (nom et ville) êtes-vous inscrit(e) ? *situation_etudes_etablissement* (15) **[V]**
* 34 Intitulé exact de la formation *situation_etudes_intitule* (15) **[V]**


* 35 Poursuivez-vous vos études en alternance ? *situation_etudes_alternance* (17) **[cat]**
    - Oui
    - Non

* 36 Pour quelle raison avez-vous principalement choisi de poursuivre des études ? *situation_etudes_raison* (17) **[cat]**
    - Pour acquérir une spécialisation, dans le cadre de mon projet professionnel
    - Pour acquérir une double compétence
    - Pour acquérir une compétence complémentaire
    - Pour optimiser mes chances de trouver un emploi
    - Dans l'attente de trouver un emploi
    - Autre


**FINSI**


PREMIERES QUESTIONS SUR VOTRE EMPLOI ACTUEL
-------------------------------------------

* 37 Il s'agit d'un° *emploi_actuel_premier_second* (166) **[ord]**
    - 1er emploi depuis la sortie de l'école
    - 2ème emploi ou plus depuis la sortie de l'école

* 38 Sur cet emploi, vous êtes *emploi_actuel_type* (165) **[cat]**
    - Salarié(e) d'une entreprise privée
    - Salarié(e) de l'Etat 
    - Salarié(e) d'une collectivité territoriale, d'une entreprise publique ou d'une structure associative
    - Non salarié(e) : chef d'entreprise, profession libérale, travailleur(e) indépendant(e)


**SI** *emploi_actuel_type* == collectivité territoriale:

* 39 Avez-vous un statut de: *emploi_actuel_statut* (0) **[cat]** (REM XXXXX)
    - Fonctionnaire
    - Agent contractuel
    
**SI** *emploi_actuel_type* == Non salarié(e) ...

* 40 Vous êtes chef d'entreprise, en êtes-vous : *emploi_actuel_statut.1* (0) **[cat]** (REM XXXXXXXXXX)
    - Le créateur 
    - Le repreneur

**FINSI**


* 41 Combien de temps avez-vous mis pour trouver cet emploi? *emploi_actuel_temps_recherche* (0) **[ord]** (REM XXXXXXXXXX)
    - Contrat avant la sortie de l'école
    - Moins de 2 mois de recherche
    - De 2 à moins de 4 mois
    - De 4 à moins de 6 mois
    - 6 mois ou plus
    
* 42 Depuis combien de temps occupez-vous cet emploi ? *emploi_actuel_temps_poste*  (0) **[?]** (REM XXXXXXXXXX)


### variables ajoutées


* france_etranger
* votre_emploi_zonegeo
* votre_emploi_pays




INFORMATIONS SUR VOTRE ENTREPRISE
---------------------------------

* 43- 49 signalétique entreprise
* 50 Secteur d'activité de votre entreprise *entreprise_secteur* (143) **[cat]** (REM: 27 secteurs !!!)
       - Agriculture, sylviculture et pêche
       - Eco-industrie, environnement et aménagement
       - Industrie agroalimentaire
       - Industrie automobile, aéronautique, navale, ferroviaire
       - Métallurgie et transformation des métaux
       - Industrie chimique, parachimique, pharmaceutique, cosmétique, transformation du caoutchouc et des plastiques
       - Luxe
       - Industries des technologies de l'information
       - Autres secteurs industriels
       - Energie
       - Bâtiment, travaux publics, construction
       - Urbanisme, Architecture
       - Transports
       - Tourisme, loisirs, hôtellerie-restauration
       - Immobilier
       - Commerce / Distribution
       - Institution financière / Banque / Assurance
       - Cabinet d'audit, expertise-comptable
       - Bureau d'études
       - Société de conseil
       - Contrôle technique
       - Technologies de l'information (services)
       - Médias, édition, art, culture ...
       - Agences de communication, publicité
       - Administration d'Etat, territoriale, hospitalière
       - Enseignement, recherche
       - Autre

### Variable ajoutée ~~(A FAIRE)~~

* *entreprise_secteur_letudiant* **[cat]** ~~(REM: Table de correspondance à faire)~~
        - Finance-Banque-Assurance
        - Audit-Conseil-Bureau d'études
        - Commerce-Distribution
        - Industrie-BTP
        - TIC (services)
        - Luxe
        - Média-Art-Culture
        - Autre

**SI** *entreprise_secteur* == etudes_conseil, 

* 51 Quel est le principal secteur d'activité dans lequel votre entreprise (bureau d'études, société de conseil) vous conduit à intervenir le plus souvent ? *entreprise_secteur_principal* **[cat]**

* 52 Quelle est la taille de l'entreprise (ou du groupe si l'entreprise appartient à un groupe) dans laquelle vous travaillez ? *entreprise_taille* (139) **[ord]**
    - 10 classes


INFORMATIONS SUR VOTRE EMPLOI
-----------------------------

* 53 Quelle est votre fonction précise ? *votre_emploi_fonction* (139) **[V]**

* 54 Quelle est votre activité principale ? *votre_emploi_activite* (118) **[cat]**
    - Direction générale
    - Gestion, finance, comptabilité
    - Audit
    - Administration
    - Juridique
    - Ressources humaines
    - Commercial (dont ingénieur d'affaires)
    - Marketing
    - Communication, publicité
    - Développement durable / Environnement
    - Achats, approvisionnement, logistique
    - Etudes - Conseil et expertise
    - Production - Exploitation
    - Méthodes, contrôle de production, maintenance
    - Maîtrise d'ouvrage
    - Qualité, sécurité, sûreté de fonctionnement
    - Assistance technique
    - Recherche-développement, études scientifiques et techniques (autre qu'informatique)
    - Informatique industrielle et technique
    - Etudes et développement en systèmes d'information
    - Réseaux, intranet, internet, télécommunications
    - Exploitation / maintenance informatique
    - Propriété industrielle, brevets, normalisation, certification
    - Recherche expérimentale
    - Enseignement - Formation
    - Autre
    
* 54(bis) + 54 (ter ) Quelle est votre activité principale ? *votre_emploi_activite* (118) **[cat]**
recodage des précédentes

* 55 Quel est votre contrat de travail ? *votre_emploi_type_contrat* **[cat]**
    - CDI (Contrat à durée indéterminée)
    - CDD (Contrat à durée déterminée)
    - Mission d'intérim
    - Contrat local à l'étranger
    - Autre

* 56 Quand a débuté votre contrat de travail ? *votre_emploi_debut* (127) **[V]** (REM ouverte texte: a convertir !)

**SI** votre_emploi_type_contrat = CDD

* 57 Quelle est la durée de votre CDD (en nombre de mois) ? *votre_emploi_duree_cdd* **[num]**

**FINSI**

* 58 Travaillez-vous à temps partiel ? UNE r *votre_emploi_temps_partiel*
    - Oui
    - Non

**SI** votre_emploi_temps_partiel = Oui

* 59 Ce temps partiel est-il voulu ou subi ? *votre_emploi_temps_partiel_subi* (2) **[cat]**
    - Voulu
    - Subi

* 60 Quelle part de temps partiel réalisez-vous ? *votre_emploi_part_temps_partiel* (2) **[V]**

**FINSI**

* 61 Avez-vous le statut cadre ou assimilé ? *votre_emploi_statut_cadre* (136) **[cat]**
    - Oui
    - Non
    - Travail à l'étranger (non concerné)

* 62 Avez-vous des personnes sous votre responsabilité hiérarchique ? *votre_emploi_statut_cadre* **[cat]**
    - Oui
    - Non

63 Avez-vous la responsabilité : Choisissez la réponse appropriée pour chaque élément :

* d'un budget : *votre_emploi_responsabilite_budget* (136) **[cat]**
    - Oui
    - Non
* d'un projet : *votre_emploi_responsabilite_projet* (135) **[cat]**
    - Oui
    - Non
* d’une équipe : *votre_emploi_responsabilite_equipe* (135) **[cat]**
    - Oui
    - Non

64 Utilisez-vous fréquemment les langues suivantes dans votre travail ?

* Français : *votre_emploi_langues_francais* (145) **[ord]**
    - Quotidiennement
    - Souvent (plusieurs heures par semaine)
    - Rarement (quelques fois par mois)
    - Très rarement
    - Jamais
* Anglais : *votre_emploi_langues_anglais* (140) **[ord]**
    - Quotidiennement
    - Souvent (plusieurs heures par semaine)
    - Rarement (quelques fois par mois)
    - Très rarement
    - Jamais
* Allemand : *votre_emploi_langues_allemand* (129) **[ord]**
    - Quotidiennement
    - Souvent (plusieurs heures par semaine)
    - Rarement (quelques fois par mois)
    - Très rarement
    - Jamais
* Espagnol : *votre_emploi_langues_espagnol* (128) **[ord]**
    - Quotidiennement
    - Souvent (plusieurs heures par semaine)
    - Rarement (quelques fois par mois)
    - Très rarement
    - Jamais

### Variables ajoutées: déclinaisons des précédentes sous forme Likert

* *votre_emploi_langues_francais_lik* (145),
* *votre_emploi_langues_anglais_lik* (140),
* *votre_emploi_langues_allemand_lik* (129)
* *votre_emploi_langues_espagnol_lik* (128)


* 65 Quelle(s) autre(s) langue(s) utilisez-vous ? *votre_emploi_langues_autres* (36) **[V]**

* 66 Votre fonction est-elle liée à l'international ? *votre_emploi_fonction_international* (137) **[cat]**
    - Oui
    - Non

* 67 Sur une échelle allant de 0 à 5, votre mission intègre-t-elle une dimension "Développement durable" ? (Q echelle) *votre_emploi_developpement_durable* (60) **[lik]** (REM Bar chart)
    - 0 : votre mission n'intègre aucune dimension "Développement durable"
    - 5 : votre mission intègre une très forte dimension "Développement durable"


* 68 Avez-vous le statut de consultant ? *votre_emploi_consultant* (134) **[cat]**
    - Oui
    - Non

### Votre Emploi: rémunération

* 69 Quelle est votre rémunération brute annuelle, hors primes, avantages en nature et gratifications (en euros) ? (ouverte num) *votre_emploi_remuneration_brut* (111) 

* 70 Pouvez-vous estimer votre rémunération variable annuelle : primes, participation, intéressement, … (en Euros) : (ouverte num) *votre_emploi_remuneration_variable* (80)

* 71 Disposez-vous d'avantages en nature ? (Fermee multiple) *votre_emploi_avantage_nature* (0)  
    - Voiture
    - Ordinateur
    - Téléphone portable
    - Autre


### Variable ajoutée

* Rémunération totale: *votre_emploi_remuneration_total* **[num]** (REM: somme des 2 précédentes - aucun avantage en nature)


* 72 Combien de temps a duré votre recherche d'emploi (en mois) *votre_emploi_temps_recherche* (65) **[num]**

* 73 Comment avez-vous trouvé cet emploi ? UNE réponse *votre_emploi_comment_trouver* **[cat]**
    - Stage de fin d'études
    - Stage année de césure
    - Apprenti : Embauché par l'entreprise d'apprentissage
    - Forum Entreprises organisé par l’IPAG
    - Réseau des anciens élèves
    - Site internet spécialisé dans l'emploi (dont APEC) 
    - Réseau social professionnel (Viadeo, LinkedIn)
    - Sites Internet d'entreprises
    - Candidature spontanée (hors candidature via un site internet)
    - Démarché par un chasseur de tête
    - Relations personnelles
    - Société personnelle / familiale
    - Autre

**SI** *votre_emploi_comment_trouver* == 'Site internet spécialisé dans l'emploi (dont APEC)'

* 74 Pouvez-vous préciser le site spécialisé ? (Q ouverte)

**FINSI**

* 75 Quel a été votre principal critère dans le choix de cet emploi ? UNE réponse *votre_emploi_principal_critere* (138) **[cat]**
    - L'adéquation avec votre projet professionnel
    - Le montant du salaire proposé
    - La notoriété de l'entreprise
    - Les perspectives de croissance de l'entreprise
    - La politique globale de relations humaines dans l'entreprise
    - Les perspectives d’évolution dans l’entreprise
    - Le lieu géographique
    - L'intérêt du travail en lui-même
    - Autre

76 Estimez-vous que votre emploi correspond:

* à votre niveau de qualification *votre_emploi_correspond_qualification* (140) **[cat]**
    - Oui
    - Non
* au secteur disciplinaire de votre formation *votre_emploi_correspond_secteur* (137)  **[cat]**
    - Oui
    - Non

* 77 Globalement, sur une échelle allant de 1 à 5 (5 = très satisfait - 1 = peu satisfait), êtes-vous satisfait(e) de votre emploi actuel ? (echelle) *votre_emploi_satisfaction* (138) **[lik]**
    - 5 - très satisfait
    - 4
    - 3
    - 2
    - 1 - peu satisfait

78 Sur une échelle de 1 à 5 (1=peu satisfaisant - 5=très satisfaisant), comment jugeriez-vous les aspects suivants de votre emploi

* vos conditions de travail *votre_emploi_note_conditions_travail* (138) **[lik]**
* vos relations avec vos collègues *votre_emploi_note_relations_collegues* (138) **[lik]**
* vos relations de travail avec votre hiérarchie  *votre_emploi_note_relations_hierarchie* (138)  **[lik]** 
* votre niveau de rémunération *votre_emploi_note_remuneration* (138) **[lik]**

POUR FINIR ...
-----------------

* 79-83 Questions ouvertes **[V]**\
*pour_finir_complements_information* (34)          
*pour_finir_jpo_titre* (0)                          
*pour_finir_jpo* (152)                             
*pour_finir_enseignement* (90)                      
*pour_finir_enseignement_recus* (90)               
*pour_finir_enseignements_absents* (83)             
*pour_finir_coordonnees_personnelles_titre* (0)    
*pour_finir_coordonnees_personnelles* (152)        

**dont**

* 81 Quels sont les enseignements qui vous semblent les plus utiles pour l'exercice de votre métier et votre insertion professionnelle ? *pour_finir_enseignement* (90)  

* 82 Parmi les enseignements reçus, quels sont ceux qui mériteraient d'être approfondis ou renforcés ? *pour_finir_enseignement_recus* (90) 

* 83 Quels sont les enseignements, absents de votre formation, qui vous auraient été utiles ? *pour_finir_enseignements_absents* (83) 

