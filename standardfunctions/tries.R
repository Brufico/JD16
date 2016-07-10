
variables <- colnames(maindf)[grep("situation_difficultes_", colnames(maindf))]

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

corp <- data.frame(variables, raisons, raisons_short)


# --------------------------------------------------------------------------------

mocat1 <- function(dataf, prefix, valvect, valname = NULL) {
        variables <- grep(prefix, colnames(dataf))
        # names(valvect) <- variables # for use in graphs
        corrtable <- data.frame(colnames(dataf)[variables],
                                valvect) # for use in graphs
        print(corrtable) #dbg
        # print(variables) #dbg
        # keep only useful cols
        dataf1 <- dataf[ , variables]

        # keep only useful rows
        isuseful <- rep(TRUE, nrow(dataf1))
        for(i in 1:nrow(dataf1))
                {isuseful[i] <- !all(is.na(dataf1[i, ]))}

        # print(isuseful) #dbg

        dataf1 <- dataf1[isuseful, ]
        ncases <- nrow(dataf1)
        # compute stats
        nbcit <- sapply(X = dataf1, FUN = function(x) length(nonavect(x)))
        percases <- 100* round(nbcit/ncases,2) # % des individus
        percit <- 100* round(nbcit/sum(nbcit),2) # % des citations
        rangmed = sapply(X = dataf1, FUN = function(x) median(nonavect(x))) # % des citations
        resdf <- data.frame(valvect, nbcit, percases, percit, rangmed)
        colnames(resdf) <- c(valname, "citations", "% individus", "% citations", "rang median")
        resdf <- resdf[ order(resdf[["citations"]], decreasing = TRUE ), ]
        #
        ## make the graph(s)
        lresdf <- melt(dataf1)
        lresdf <- nonadf(lresdf,"value")
        lresdf$variable <- vlookup(lresdf$variable, searchtable = corrtable)
        # order the factor in reverse because of coord_flip
        lresdf$variable <- orderfact(lresdf , "variable", orderdesc = FALSE)

        p1 <- ggplot(lresdf, aes(variable)) +
                geom_bar(aes(y = 100*..count.. / sum(..count..))) +
                # scale_x_discrete(labels = valvect) +
                labs(y = "% individus", x = valname) +
                coord_flip()

        p2 <- ggplot(lresdf, aes(variable, value)) +
                geom_violin() +
                geom_jitter(height = 0.3, width = 0.5,
                            alpha = 0.4, color = "steelblue") +
                scale_x_discrete(labels = NULL) +
                labs(x = NULL, y = 'Rang citation') +
                coord_flip()
        # function for displaying the multiplot
        # display.multiplot <- function(){
        #         multiplot(p1, p2, cols = 2)
        # }

        make.result( name = prefix,
                     numcases = ncases,
                     ptable = resdf,
                     plot = quote(multiplot(plot1, plot2, cols = 2)),
                     # plot = quote(display.multiplot()),
                     plot1 = p1,
                     plot2 = p2 )
}


# essai ==============================================================





#------------------------------------------------------------------------------

res <- mocat1(dataf = maindf,
              prefix = "situation_difficultes_",
              valvect = raisons_short,
              valname = "Raison")

windows(width = 12)
# eval(res$plot)
with(res, eval(plot))
dev.off()

View(res$ptable)






# setresult("situation_difficultes")





# ===================================================================
#

# 28 traitement de la question à réponses multiples ordonnées

variables <- colnames(maindf)[grep("situation_difficultes_", colnames(maindf))]

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
                   "Formation inadaptée // marché de l'emploi",
                   "Salaire insuffisant",
                   "Autre difficulté")

corp <- data.frame(variables, raisons, raisons_short)



# traitement manuel
#
diffdf <- repdf[variables]


nbcit <- sapply(X = diffdf, FUN = function(x) length(nonavect(x)))
percit <- 100* round(nbcit/sum(nbcit),2)
rangmed = sapply(X = diffdf, FUN = function(x) median(nonavect(x)))


raisdf <- data.frame(raisons,nbcit, percit, rangmed)
colnames(raisdf) <- c("raisons", "citations", "% citations", "rang median")
raisdf <- raisdf[ order(raisdf[["% citations"]], decreasing = TRUE ), ]

lresdf <- melt(diffdf)
lresdf <- nonadf(lresdf,"value")
lresdf$variable <-
        vlookup(value = lresdf$variable,searchtable = corp,searchcol = 1, returncol = 3)
colnames(lresdf) <- c("raison", "rang")

lresdf$raison <- orderfact(lresdf , "raison",orderdesc = FALSE)

# ggplot(lresdf, aes(raison, rang))+
#         geom_violin() +
#         geom_jitter(height = 0.5, width=0.5,
#                     alpha =.5, color ="blue") +
#         geom_bar(aes(x = raison, y=-..count..)) +
#         coord_flip()
#
# p <- ggplot(lresdf, aes(raison, rang))+
#         geom_violin() +
#         geom_jitter(height = 0.5, width=0.5,
#                     alpha =.5, color ="blue") +
#         geom_bar(aes(x = raison, y=-..count.. / 10)) +
#         # scale_x_discrete(limits = rev(levels(lresdf$raison)))+
#         coord_flip()
#
# windows()
# p
# dev.off()
#
#
#
#
#
# res=make.result(ptable = raisdf)
# setresult("situation_difficultes")


# ----------------------------------------------------------------------
# multiplot

p1 <- ggplot(lresdf, aes(raison, rang))+
        geom_violin() +
        geom_jitter(height = 0.5, width=0.5,
                    alpha =.5, color ="blue") +
        scale_x_discrete(labels=NULL)+
        labs(x=NULL, y = 'Rang citation') +
        coord_flip()

p2 <- ggplot(lresdf, aes(raison))+
        geom_bar(aes(y = 100*..count.. / sum(..count..))) +
        labs(y="% individus", x = "raison") +
        coord_flip()

windows(width = 12)

multiplot(p2, p1, cols=2)
