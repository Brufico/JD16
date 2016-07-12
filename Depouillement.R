#' ---
#' title: "Enquête JD 2015"
#' subtitle: "Code: Depouillement question par question"
#' author: "Bruno Fischer Colonimos"
#' date: "27 juin 2016"
#' output:
#'      html_document:
#'         css: customex2.css
#'         number_sections: yes
#'         theme: readable
#'         toc: yes
#'      pdf_document:
#'         toc: yes
#'      word_document: default
#' ---
#'

#' Loading packages
#' ================

library(dplyr)
library(ggplot2)


#' Sourcing more code
#' ================
#'
# more code
mcodir <- "addcode"
code1name <- "utils.R"
source(file.path(".", mcodir, code1name))

# more code :  standard functions
stdfundir <- "standardfunctions"
stdfunname <- "standardfunctionsV5.R"
source(file.path(".", stdfundir, stdfunname))

#'
#' Récupération des données prétraitées
#' ====================================
#'

# path(rda)
datadir2 <- "data2"
alldatapath <- file.path(".", datadir2, "alldata.Rda")
# loading
whatload <- load(alldatapath)
# verification
# whatload


#'
#' Depouillement question par question
#' ====================================
#'


#'
#' NON Traité
#' -----------
#'
#' POUR COMMENCER ....
#' 1 NOM *\
#' 2 PRENOM *\
#' COORDONNEES PERSONNELLES\
#' 3 ADRESSE\
#' 4 CODE POSTAL\
#' 5 VILLE\
#' 6 PAYS\
#' 7 TELEPHONE DOMICILE\
#' 8 TELEPHONE PORTABLE\
#' 9 E MAIL PERSONNEL (AUTRE QUE IPAG)\
#'

# SUR VOTRE STAGE DE FIN D'ETUDES
# 10 Avez-vous reçu une proposition d’embauche de votre entreprise d'accueil à l’issue de votre stage de fin d'études ?
# -Oui
# -Non

r_stg_fin_etude_proposition <- cat1(dataf=maindf, nomfact="stg_fin_etude_proposition", useNA = "no",
                                    orderfreq = FALSE,
                                    rfreq = TRUE, digits = 2, cfill = "steelblue")

r_stg_fin_etude_proposition


#' 11 Avez-vous accepté cette proposition ? [Répondez seulement à cette question si vous avez répondu 'Oui' à la question 'FIN ETUDES]

r_stg_fin_etude_accepte <- cat1(dataf=maindf, nomfact="stg_fin_etude_accepte", useNA = "no",
                                    orderfreq = FALSE,
                                    rfreq = TRUE, digits = 2, cfill = "steelblue")

r_stg_fin_etude_accepte


'# 12 Pour quelle(s) raison(s) avez-vous refusé cette proposition ? [Répondez seulement à cette question si vous avez répondu 'Non' à la question 'FIN ETUDES 2]

stg_fin_etude_raison_refus

maindf %>%
        filter(!is.na(stg_fin_etude_raison_refus)) %>%
        select(stg_fin_etude_raison_refus)



 SUR L'ENTREPRISE QUI VOUS A ACCUEILLI EN ALTERNANCE
 13 Avez-vous suivi un cursus en alternance à l’IPAG ?
 -Oui
 -Non

 14 Dans le cadre de cette alternance, quel type de contrat avez-vous signé ?
 [Répondez seulement à cette question si vous avez répondu 'Oui' à la question 'CURSUS EN ALTERNANCE]
  -Contrat d’apprentissage
  -Contrat de professionnalisation

  15 Avez-vous reçu une proposition d'embauche de la part de l'entreprise, à la fin de votre contrat en alternance ?
  [Répondez seulement à cette question si vous avez répondu 'Oui' à la question 'CURSUS EN ALTERNANCE]
 Veuillez sélectionner SEULEMENT UNE réponse
 -Oui
 -Non

 16 Est-ce pour poursuivre la mission sur laquelle vous avez travaillé pendant votre alternance ?
 [Répondez seulement à cette question si vous avez répondu 'Oui' à la question 'FIN CONTRAT ALTERNANCE]
  Veuillez sélectionner SEULEMENT UNE réponse
  -Oui
  -Non
  -Autre

  17 Si vous n'avez pas eu de proposition d'embauche, savez-vous pour quelle(s) raison(s) ?
  [Répondez seulement à cette question si vous avez répondu 'Non' à la question 'CURSUS EN ALTERNANCE]
 Choisissez TOUTES les réponses qui conviennent :
         -L'entreprise n'embauche pas actuellement
 -L'entreprise ne considère pas l’alternance comme une pré-embauche
 -La mission est terminée
 -Autre
 18 Avez-vous accepté cette proposition ?
 [Répondez seulement à cette question si vous avez répondu 'Oui' à la question 'FIN CONTRAT ALTERNANCE]
Veuillez sélectionner SEULEMENT UNE réponse
-Oui
-Non

19 Pour quelle(s) raison(s) avez-vous refusé cette proposition ?
[Répondez seulement à cette question si vous avez répondu 'Oui' à la question 'FIN CONTRAT ALTERNANCE]
 Choisissez TOUTES les réponses qui conviennent :
 -Rémunération insuffisante
 -Manque d'intérêt de la mission proposée
 -Volonté de changer d'environnement
 -Meilleure proposition dans une autre entreprise
 -Absence de perspectives d'évolution
 -Autre

 SITUATION ACTUELLE
 20 Votre situation actuelle *
         Veuillez sélectionner SEULEMENT UNE réponse
 -En activité professionnelle (y compris volontariat)
 -En création d'entreprise
 -En recherche d'emploi
 -En poursuite d'études (hors thèse)
 -Sans activité volontairement

 21 Si vous êtes en activité professionnelle, avez-vous le statut de volontaire (VIE, VIA) ?
 [Répondez seulement à cette question si vous avez répondu 'En activité professionnelle (y compris volontariat)' à la question 'SITUATION ACTUELLE]
Veuillez sélectionner SEULEMENT UNE réponse
-Oui
-Non

22 De quel type de volontariat s'agit-il ?
[Répondez seulement à cette question si vous avez répondu 'Oui' à la question 'VIE ]
Veuillez sélectionner SEULEMENT UNE réponse
-Volontariat International en Entreprise
-Volontariat International en Administration
-Volontariat de Solidarité Internationale
-Volontariat Civil
-Autre

23 L'entreprise que vous créez est-elle déjà en activité, ou à l'état de projet plus ou moins avancé?*
        [Répondez seulement à cette question si vous avez répondu 'En création d'entreprise' à la question 'SITUATION ACTUELLE]
Veuillez sélectionner SEULEMENT UNE réponse
-En activité
-Encore en projet
*Si l'entreprise en création est déjà en activité, vous serez considéré(e) comme étant vous-même en activité professionnelle.

24 Etes-vous à la recherche d'un emploi depuis la sortie de l'école ?
[Répondez seulement à cette question si vous avez répondu 'En recherche d'emploi' à la question 'SITUATION ACTUELLE]
Veuillez sélectionner SEULEMENT UNE réponse
-Oui
-Non

25 Depuis combien de temps êtes-vous à la recherche d'un emploi ?
[Répondez seulement à cette question si vous avez répondu 'En recherche d'emploi' à la question
 'SITUATION ACTUELLE]
Veuillez sélectionner SEULEMENT UNE réponse
-Depuis moins de 2 mois
-2 mois à moins de 4 mois
-4 mois à moins de 6 mois
-6 mois et plus

26 Avez-vous refusé une ou plusieurs propositions d'emploi depuis ?
[Répondez seulement à cette question si vous avez répondu 'En recherche d'emploi' à la question
'SITUATION ACTUELLE]
Veuillez sélectionner SEULEMENT UNE réponse
-Oui
-Non

27 Combien de propositions d'emploi avez-vous refusé ?
[Répondez seulement à cette question si vous avez répondu 'Oui' à la question 'RECHERCHE TER]
 Écrivez votre réponse ici :

 28 Quelles difficultés rencontrez-vous dans votre recherche d'emploi ?
 Jusqu'à 3 réponses possibles, à classer par ordre d'importance de 1 (la moins importante) à 3 (la plus importante).
 [Répondez seulement à cette question si vous avez répondu 'En recherche d'emploi' à la question
 'SITUATION ACTUELLE]
 Numérotez chaque case dans l'ordre de vos préférences de 1 à 9
 -Difficultés à trouver des offres d'emploi correspondant au projet professionnel
 -Mobilité géographique difficile
 -Méconnaissance des débouchés possibles pour ma formation
 -Manque d'expérience professionnelle
 -Difficulté à mettre en valeur mes compétences
 -Formation mal, ou pas reconnue par les employeurs
 -Formation inadaptée au marché de l'emploi
 -Salaire proposé insuffisant
 -Autre difficulté non mentionnée dans la liste

 29 Précisez
 [Répondez seulement à cette question si vous avez répondu 'Autre difficulté non mentionnée dans la liste' à la question 'RECHERCHE MOTIFS]
 Écrivez votre réponse ici :

 30 Précisez
 [Répondez seulement à cette question si vous avez répondu 'Autre difficulté non mentionnée dans la liste' à la question 'RECHERCHE MOTIFS]
 Écrivez votre réponse ici :
         31 Précisez
 [Répondez seulement à cette question si vous avez répondu 'Autre difficulté non mentionnée dans la liste' à la question 'RECHERCHE MOTIFS]
 Écrivez votre réponse ici :

 32 Quel type d'études poursuivez-vous ?
 [Répondez seulement à cette question si vous avez répondu 'En poursuite d'études (hors thèse)' à la question 'SITUATION ACTUELLE]
 Veuillez sélectionner SEULEMENT UNE réponse
 -Mastère spécialisé (MS) accrédité par la CGE - Conférence des Grandes Ecoles
 -Mastère en science (MSc) de la CGE - Conférence des Grandes Ecoles
 -Master universitaire
 -Master of Science (MSc)
 -Master of Business Administration (MBA)
 -Préparation d'un concours
 -Autre

 33 Dans quel établissement (nom et ville) êtes-vous inscrit(e) ?
 [Répondez seulement à cette question si vous avez répondu 'En poursuite d'études (hors thèse)' à la question 'SITUATION ACTUELLE]
 Écrivez votre réponse ici :

 34 Intitulé exact de la formation
 [Répondez seulement à cette question si vous avez répondu 'En poursuite d'études (hors thèse)' à la question 'SITUATION ACTUELLE]
 Écrivez votre réponse ici :

 35 Poursuivez-vous vos études en alternance ?
 [Répondez seulement à cette question si vous avez répondu 'En poursuite d'études (hors thèse)' à la question 'SITUATION ACTUELLE]
 Veuillez sélectionner SEULEMENT UNE réponse
 -Oui
 -Non

 36 Pour quelle raison avez-vous principalement choisi de poursuivre des études ?
 [Répondez seulement à cette question si vous avez répondu 'En poursuite d'études (hors thèse)' à la question 'SITUATION ACTUELLE]
 Veuillez sélectionner SEULEMENT UNE réponse
 -Pour acquérir une spécialisation, dans le cadre de mon projet professionnel
 -Pour acquérir une double compétence
 -Pour acquérir une compétence complémentaire
 -Pour optimiser mes chances de trouver un emploi
 -Dans l'attente de trouver un emploi
 -Autre








 PREMIERES QUESTIONS SUR VOTRE EMPLOI ACTUEL
 Questions pour les diplômés en poste
 37 Il s'agit d'un
 Veuillez sélectionner SEULEMENT UNE réponse
 -1er emploi depuis la sortie de l'école
 -2ème emploi ou plus depuis la sortie de l'école

 38 Sur cet emploi, vous êtes
 Veuillez sélectionner SEULEMENT UNE réponse
 -Salarié(e) d'une entreprise privée
 -Salarié(e) de l'Etat
 -Salarié(e) d'une collectivité territoriale, d'une entreprise publique ou d'une structure associative
 - Non salarié(e) : chef d'entreprise, profession libérale, travailleur(e) indépendant(e)

 39 Avez-vous un statut de
 [Répondez seulement à cette question si vous avez répondu 'Salarié(e) d'une collectivité territoriale, d'une entreprise publique ou d'une structure associative' ou 'Salarié(e) de l'Etat' à la question 'POSTE2]
 Veuillez sélectionner SEULEMENT UNE réponse
 -Fonctionnaire
 -Agent contractuel

 40 Vous êtes chef d'entreprise, en êtes-vous
 [Répondez seulement à cette question si vous avez répondu 'Non salarié(e) : chef d'entreprise, profession libérale, travailleur(e) indépendant(e)' à la question 'POSTE2]
 Veuillez sélectionner SEULEMENT UNE réponse
 -Le créateur
 -Le repreneur

 41 Combien de temps avez-vous mis pour trouver cet emploi ou créer votre entreprise à la sortie de l'école ?
 Veuillez sélectionner SEULEMENT UNE réponse
 -Contrat avant la sortie de l'école
 -Moins de 2 mois de recherche
 -De 2 à moins de 4 mois
 -De 4 à moins de 6 mois
 -6 mois ou plus

 42 Depuis combien de temps occupez-vous cet emploi ?
 Écrivez votre réponse ici :


         INFORMATIONS SUR VOTRE ENTREPRISE
 Questions pour les diplômés en poste
 43 Nom de votre entreprise
 Écrivez votre réponse ici :

         44 Adresse de votre entreprise
 Écrivez votre réponse ici :

         45 Code Postal de votre entreprise
 Écrivez votre réponse ici :
         46 Ville de votre entreprise
 Écrivez votre réponse ici :

         47 Pays de votre entreprise
 Écrivez votre réponse ici :

         48 Votre email professionnel
 Écrivez votre réponse ici :

         49 Votre téléphone professionnel
 Écrivez votre réponse ici :

         50 Secteur d'activité de votre entreprise
 Veuillez sélectionner SEULEMENT UNE réponse
 -Agriculture, sylviculture et pêche
 -Eco-industrie, environnement et aménagement
 -Industrie agroalimentaire
 -Industrie automobile, aéronautique, navale, ferroviaire
 -Métallurgie et transformation des métaux
 -Industrie chimique, parachimique, pharmaceutique, cosmétique, transformation du caoutchouc et des plastiques
 -Luxe
 -Industries des technologies de l'information
 -Autres secteurs industriels
 -Energie
 -Bâtiment, travaux publics, construction
 -Urbanisme, Architecture
 -Transports
 -Tourisme, loisirs, hôtellerie-restauration
 -Immobilier
 -Commerce / Distribution
 -Institution financière / Banque / Assurance
 -Cabinet d'audit, expertise-comptable
 -Bureau d'études
 -Société de conseil
 -Contrôle technique
 -Technologies de l'information (services)
 -Médias, édition, art, culture ...
 -Agences de communication, publicité
 -Administration d'Etat, territoriale, hospitalière
 -Enseignement, recherche
 -Autre

 51 Quel est le principal secteur d'activité dans lequel votre entreprise (bureau d'études, société de conseil) vous conduit à intervenir le plus souvent ?
[Répondez seulement à cette question si vous avez répondu 'Société de conseil' ou 'Bureau d'études' à la question 'ENTREP - ACTIVITE]
Veuillez sélectionner SEULEMENT UNE réponse
-Agriculture, sylviculture, pêche
-Eco-industrie, environnement et aménagement
-Industrie agroalimentaire
-Industrie automobile, aéronautique, navale, ferroviaire
-Métallurgie et transformation des métaux
-Industrie chimique, parachimique, pharmaceutique, cosmétique, transformation du caoutchouc et des plastiques
-Luxe
-Industrie des technologies de l'information
-Autres secteurs industriels
-Energie
-Bâtiment, travaux publics, construction
-Urbanisme, architecture
-Transports
-Tourisme, loisirs, hôtellerie-restauration
-Immobilier
-Commerce / Distribution
-Institutions financières / Banque / Assurance
-Cabinet d'audit, expertise-comptable
-Bureau d'études
-Société de conseil
-Contrôle technique
-Technologies de l'information (services)
-Médias, édition, art, culture ...
-Agences de communication, publicité
-Administration d'Etat, territoriale, hospitalière
-Enseignement, recherche
-Autres secteurs

52 Quelle est la taille de l'entreprise (ou du groupe si l'entreprise appartient à un groupe) dans laquelle vous travaillez ?
                                         Veuillez sélectionner SEULEMENT UNE réponse
                                         -inférieur à 10 salariés
                                         -de 10 à 19
                                         -de 20 à 49
                                         -de 50 à 99
                                         -de 100 à 249
                                         -de 250 à 499
                                         -de 500 à 1 999
                                         -de 2 000 à 4 999
                                         -de 5 000 à 9 999
                                         -de 10 000 à 49 999
                                         -50 000 salariés et plus

                                         INFORMATIONS SUR VOTRE EMPLOI
                                         Questions pour les diplômés en poste
                                         53 Quelle est votre fonction précise ?
                                         Écrivez votre réponse ici :

                                         54 Quelle est votre activité principale ?
                                         Veuillez sélectionner SEULEMENT UNE réponse
                                         -Direction générale
                                         -Gestion, finance, comptabilité
                                         -Audit
                                         -Administration
                                         -Juridique
                                         -Ressources humaines
                                         -Commercial (dont ingénieur d'affaires)
-Marketing
-Communication, publicité
-Développement durable / Environnement
-Achats, approvisionnement, logistique
-Etudes - Conseil et expertise
-Production - Exploitation
-Méthodes, contrôle de production, maintenance
-Maîtrise d'ouvrage
-Qualité, sécurité, sûreté de fonctionnement
-Assistance technique
-Recherche-développement, études scientifiques et techniques (autre qu'informatique)
-Informatique industrielle et technique
-Etudes et développement en systèmes d'information
-Réseaux, intranet, internet, télécommunications
-Exploitation / maintenance informatique
-Propriété industrielle, brevets, normalisation, certification
-Recherche expérimentale
-Enseignement - Formation
-Autre

55 Quel est votre contrat de travail ?
Veuillez sélectionner SEULEMENT UNE réponse
-CDI (Contrat à durée indéterminée)
-CDD (Contrat à durée déterminée)
-Mission d'intérim
-Contrat local à l'étranger
-Autre

56 Quand a débuté votre contrat de travail ?
Entrez une date :

57 Quelle est la durée de votre CDD (en nombre de mois) ?
[Répondez seulement à cette question si vous avez répondu 'CDD (Contrat à durée déterminée)' à la question 'JOB - CONTRAT]
 Entrez une date :

         58 Travaillez-vous à temps partiel ?
 Veuillez sélectionner SEULEMENT UNE réponse
 -Oui
 -Non

 59 Ce temps partiel est-il voulu ou subi ?
 [Répondez seulement à cette question si vous avez répondu 'Oui' à la question 'TPS PARTIEL]
  Veuillez sélectionner SEULEMENT UNE réponse
  -Voulu
  -Subi

  60 Quelle part de temps partiel réalisez-vous ?
  [Répondez seulement à cette question si vous avez répondu 'Oui' à la question 'TPS PARTIEL]
 Écrivez votre réponse ici :
         61 Avez-vous le statut cadre ou assimilé ?
 Veuillez sélectionner SEULEMENT UNE réponse
 -Oui
 -Non
 -Travail à l'étranger (non concerné)

 62 Avez-vous des personnes sous votre responsabilité hiérarchique ?
 Veuillez sélectionner SEULEMENT UNE réponse
 -Oui
 -Non

 63 Avez-vous la responsabilité
 Choisissez la réponse appropriée pour chaque élément :
 -d'un budget :
         Oui
 Non
 -d'un projet :
 Oui
 Non
 -d’une équipe
 Oui
 Non

 64 Utilisez-vous fréquemment les langues suivantes dans votre travail ?
 Choisissez la réponse appropriée pour chaque élément :
 -Français :
 Quotidiennement
 Souvent (plusieurs heures par semaine)
 Rarement (quelques fois par mois)
 Très rarement
 Jamais
 - Anglais :
 Quotidiennement
 Souvent (plusieurs heures par semaine)
 Rarement (quelques fois par mois)
 Très rarement
 Jamais
 - Allemand :
 Quotidiennement
 Souvent (plusieurs heures par semaine)
 Rarement (quelques fois par mois)
 Très rarement
 Jamais
 -Espagnol :
 Quotidiennement
 Souvent (plusieurs heures par semaine)
 Rarement (quelques fois par mois)
 Très rarement
 Jamais



 65 Quelle(s) autre(s) langue(s) utilisez-vous ?
 Écrivez votre réponse ici :

 66 Votre fonction est-elle liée à l'international ?
 Veuillez sélectionner SEULEMENT UNE réponse
 -Oui
 -Non

 67 Sur une échelle allant de 0 à 5, votre mission intègre-t-elle une dimension "Développement durable" ?
 0 : votre mission n'intègre aucune dimension "Développement durable"
 5 : votre mission intègre une très forte dimension "Développement durable"
 Écrivez votre réponse ici :

 68 Avez-vous le statut de consultant ?
 Veuillez sélectionner SEULEMENT UNE réponse
 -Oui
 -Non

 69 Quelle est votre rémunération brute annuelle, hors primes, avantages en nature et gratifications (en euros) ?
 Écrivez votre réponse ici :

 70 Pouvez-vous estimer votre rémunération variable annuelle : primes, participation, intéressement, … (en Euros)
 Écrivez votre réponse ici :

 71 Disposez-vous d'avantages en nature ?
 Choisissez TOUTES les réponses qui conviennent :
         -Voiture
 -Ordinateur
 -Téléphone portable
 -Autre

 72 Combien de temps a duré votre recherche d'emploi (en mois) ?
 Écrivez votre réponse ici :

 73 Comment avez-vous trouvé cet emploi ?
 Veuillez sélectionner SEULEMENT UNE réponse
 -Stage de fin d'études
 -Stage année de césure
 -Apprenti : Embauché par l'entreprise d'apprentissage
 -Forum Entreprises organisé par l’IPAG
 -Réseau des anciens élèves
 -Site internet spécialisé dans l'emploi (dont APEC)
 -Réseau social professionnel (Viadeo, LinkedIn)
 -Sites Internet d'entreprises
 -Candidature spontanée (hors candidature via un site internet)
 -Démarché par un chasseur de tête
 -Relations personnelles
 -Société personnelle / familiale
 -Autre
 74 Pouvez-vous préciser le site spécialisé ?
 [Répondez seulement à cette question si vous avez répondu 'Site internet spécialisé dans l'emploi (dont APEC)' à la question 'JOB - ORIGINE]
 Écrivez votre réponse ici :

         75 Quel a été votre principal critère dans le choix de cet emploi ?
 Veuillez sélectionner SEULEMENT UNE réponse
 -L'adéquation avec votre projet professionnel
 -Le montant du salaire proposé
 -La notoriété de l'entreprise
 -Les perspectives de croissance de l'entreprise
 -La politique globale de relations humaines dans l'entreprise
 -Les perspectives d’évolution dans l’entreprise
 -Le lieu géographique
 -L'intérêt du travail en lui-même
 -Autre

 76 Estimez-vous que votre emploi correspond
 Choisissez la réponse appropriée pour chaque élément :
 -à votre niveau de qualification
 Oui
 Non
 -au secteur disciplinaire de votre formation
 Oui
 Non

 77 Globalement, sur une échelle allant de 1 à 5 (5 = très satisfait - 1 = peu satisfait), êtes-vous satisfait(e) de votre emploi actuel ?
 Veuillez sélectionner SEULEMENT UNE réponse
 5 - très satisfait
 4
 3
 2
 1 - peu satisfait

 78 Sur une échelle de 1 à 5 (1=peu satisfaisant - 5=très satisfaisant), comment jugeriez-vous les aspects suivants de votre emploi
 Choisissez la réponse appropriée pour chaque élément :
 -vos conditions de travail
 -vos relations avec vos collègues
 -vos relations de travail avec votre hiérarchie
 -votre niveau de rémunération










 POUR FINIR ...
 79 Avez-vous des compléments d'information à nous communiquer ?
 Écrivez votre réponse ici :

         80 L’IPAG organise régulièrement des Journées Portes Ouvertes, au cours desquelles des diplômés témoignent de leur parcours à l’IPAG et de leur expérience professionnelle.
 Pas de longs discours à préparer mais expliquer pourquoi vous avez choisi l’IPAG, pourquoi vous vous y êtes plu, votre cursus (spécialisation, stages) et votre parcours depuis que vous avez quitté l'école.
 Accepteriez-vous de participer à une prochaine Portes Ouvertes, en fonction de vos disponibilités ?
 Veuillez sélectionner SEULEMENT UNE réponse
 -Oui
 -Non

 81 Quels sont les enseignements qui vous semblent les plus utiles pour l'exercice de votre métier et votre insertion professionnelle ?
 Écrivez votre réponse ici :

         82 Parmi les enseignements reçus, quels sont ceux qui mériteraient d'être approfondis ou renforcés ?
 Écrivez votre réponse ici :

 83 Quels sont les enseignements, absents de votre formation, qui vous auraient été utiles ?
 Écrivez votre réponse ici :





