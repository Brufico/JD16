
library(knitr)



res <- cat2(emploidf, "filiere","situation_emploi",
           orderfreq1 =TRUE, ordervar1 = "situation_emploi" , orderval1 = "En activité professionnelle",
           orderfun1 = mean)

ptable =select(res$table, filiere, num, perclabs)


lbl <- as.character(res$table$filiere)
lbl[5] <- "Gestion des Hommes et RSE"
lbl[6] <- "Global supply chain management – Eco. circ."



windows(width = 10)

res$plot +
        theme(axis.text.x = element_text(angle = 67, hjust=1)) +
        scale_x_discrete(limits = res$table$filiere, labels=lbl) +
        scale_fill_discrete(NULL) +
        geom_text(data = res$table , aes(x = filiere, y = .05, label = numlabs), angle = 90, hjust=0) +
        geom_text(data = res$table , aes(x = filiere,
                                        y = percval - 0.03,
                                        label = perclabs)) +
        theme(legend.position = c(0.85, 0.85)) +
        labs(title = "Situation sur le marché de l' emploi",
             x = "",
             y = "pourcentage")


# ---------------------------------------------------------------------------------------------
# levels(repdf$situation_situation)
# shortsit <- c("activité pro.", "création d'entreprise","poursuite etudes",
#               "recherche d'emploi", "Sans activité volontaire")

# repdf$situation_situation_short <- repdf$situation_situation
# levels(repdf$situation_situation_short) <- shortsit
#


res <- cat2(repdf, "filiere","situation_situation_short",
            orderfreq1 = TRUE, ordervar1 = "situation_situation_short" ,
            orderval1 = "activité pro.", orderfun1 = mean)


ptable =select(res$table, filiere, num, perclabs)

res$table

# lbl <- as.character(res$table$filiere)
# lbl[3] <- "Gestion des Hommes et RSE"
# lbl[5] <- "Global supply chain management – Eco. circ."

lbl <-  sapply(as.character(res$table$filiere),
               function(x){
                       if (x == "Gestion des Hommes et Responsabilité Sociale des Entreprises"){
                               res <-  "Gestion des Hommes et RSE"
                       } else if (x == "Global supply chain management – Economie circulaire") {
                               res <- "Global supply chain management – Eco. circ."
                       } else {
                               res <- x
                       }
                       res
               } )




# , labels=lbl

windows(width = 10)

res$plot +
        theme(axis.text.x = element_text(angle = 67, hjust=1)) +
        scale_x_discrete(limits = res$table$filiere , labels=lbl) +
        scale_fill_discrete(NULL) +
        geom_text(data = res$table , aes(x = filiere, y = .05, label = numlabs), angle = 90, hjust=0) +
        geom_text(data = res$table , aes(x = filiere,
                                         y = percval *.8,
                                         label = ifelse(percval >= .3 , perclabs, ""))) +
        theme(legend.position = c(.90,.8)) +
        labs(title = "Situation sur le marché de l' emploi",
             x = "",
             y = "pourcentage")



# ------------------------------------------------------------------------------------------------

library(stats)

m <- matrix(1:4, 2)
m
margin.table(m, 1)
margin.table(m, 2)

mpr =apply(m,2, function(x)  {x/ sum(x)})
mpr

addmargins(m)



ptable1 <- addmargins(ptable, 1, sum)
col1 <- margin.table(ptable1,1)

prptable <- round(prop.table(ptable1,1)*100,1)

prptable2 <- cbind(col1,prptable)

prptable2[order(prptable2[ , 1], decreasing = TRUE), ]

# =========================================================

repdf$votre_emploi_remuneration_total

res <- catnum1c(repdf, "france_etranger", "votre_emploi_remuneration_total",
                labelall = "Ensemble", labelgroups = "Par situation")
setresult('votre_emploi_remuneration_total_x_france_etranger')


res <- catnum1c(repdf, "votre_emploi_zonegeo", "votre_emploi_remuneration_total",
                labelall = "Ensemble", labelgroups = "Par situation")
setresult('votre_emploi_remuneration_total_x_votre_emploi_zonegeo')


res <- catnum1c(repdf, "france_etranger", "votre_emploi_remuneration_brut",
                labelall = "Ensemble", labelgroups = "Par situation")
setresult('votre_emploi_remuneration_brut_x_france_etranger')


res <- catnum1c(repdf, "votre_emploi_zonegeo", "votre_emploi_remuneration_brut",
                labelall = "Ensemble", labelgroups = "Par situation")
setresult('votre_emploi_remuneration_brut_x_votre_emploi_zonegeo')


res <- catnum1c(repdf, "filiere", "votre_emploi_remuneration_total",
                labelall = "Ensemble", labelgroups = "Par filière")
setresult('votre_emploi_remuneration_total_x_filiere')


res$summaries

windows(width=10)
res$plot1 + guides(color=FALSE) +
        scale_color_manual(values = rep(c("red","blue", "darkolivegreen2", "orange"), 5)) +
        scale_y_continuous(limits=c(0, NA))

dev.off()

res$plot2

colors()

