
a <- 1

modifa <- function(i){
        a <<- i
}

modifa(5)
a


class(maindf$votre_emploi_langues_francais_lik)
maindf$votre_emploi_langues_allemand_lik

head(maindf)

tablesect = data.frame(v1=levels(maindf$entreprise_secteur), v2= c("") )


maindf$votre_emploi_satisfaction
maindf$votre_emploi_note_conditions_travail
maindf$votre_emploi_note_relations_collegues
maindf$votre_emploi_note_relations_hierarchie
maindf$votre_emploi_note_remuneration


mean(maindf$votre_emploi_remuneration_total, na.rm = TRUE)
v <- maindf$votre_emploi_remuneration_total[which(!is.na(maindf$votre_emploi_remuneration_total))]
summary(v)
nclass.FD(v)
ggplot(maindf, aes(votre_emploi_remuneration_total)) +
        geom_histogram(bins = nclass.FD(v))

ggplot(maindf, aes(votre_emploi_remuneration_total, y = ..count..)) +
        geom_histogram(binwidth = 3000) +
        geom_density(color="red", adjust=1) +
        facet_grid(entreprise_secteur_letudiant~.)
