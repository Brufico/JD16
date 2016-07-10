

# Example data

raisons <- c("Difficultés à trouver des offres d'emploi correspondant au projet professionnel",
             "Mobilité géographique difficile",
             "Méconnaissance des débouchés possibles pour ma formation",
             "Manque d'expérience professionnelle",
             "Difficulté à mettre en valeur mes compétences",
             "Formation mal, ou pas reconnue par les employeurs",
             "Formation inadaptée au marché de l'emploi",
             "Salaire proposé insuffisant",
             "Autre difficulté non mentionnée dans la liste")


raisons_short <- c("offres d'emploi =/ projet pro.",
                   "Mobilité géo. difficile",
                   "Débouchés pour ma formation?",
                   "Manque d'expérience pro.",
                   "Difficulté à faire valoir compétences",
                   "Formation mal reconnue",
                   "Formation inadaptée au marché",
                   "Salaire insuffisant",
                   "Autre difficulté")

# --------------------------------------------------------------------------------

mocat1 <- function(dataf, prefix, valvect, valshort = NULL, valname = NULL) {
        variables <- grep(prefix, colnames(dataf), value = TRUE) # => to return the cols names
        # names(valvect) <- variables # for use in graphs
        if (is.null(valshort)) {valshort <- valvect}
        if (length(variables) != length(valvect) |
            length(variables) != length(valshort)){
                error(" mocat1 : argument lengths mismatch")
        }
        corrtable <- data.frame(variable = variables,
                                valvect,
                                valshort) # correspondance table for use in graphs and tables
        # message("corrtable") #dbg
        # print(corrtable) #dbg

        # keep only useful cols
        dataf <- dataf[ , variables]

        # keep only useful rows
        isuseful <- rep(TRUE, nrow(dataf)) #initialisation
        for(i in 1:nrow(dataf))
                {isuseful[i] <- !all(is.na(dataf[i, ]))}
        dataf <- dataf[isuseful, ]
        ncases <- nrow(dataf) # nombre de cas

        ## make the graph(s): long format for the ranks dfrm
        lresdf <- melt(dataf)
        lresdf <- nonadf(lresdf,"value") # get rid of NA's
        # lresdf$variable <- vlookup(lresdf$variable, searchtable = corrtable) ## not now
        # order the factor in reverse because of coord_flip. useful ?
        lresdf$variable <- orderfact(lresdf , "variable", orderdesc = FALSE) ## ? useful?

        # compute % of individuals explicitly and record the values of the variable in lims
        # message("begin restable") #dbg
        # print(lresdf)#dbg

        restable <- group_by(lresdf, variable) %>%
                summarise(nbcit = n(),
                          rangmed = median(value)) %>%
                arrange(desc(nbcit)) %>%
                mutate(percases = 100 * nbcit / ncases,
                       percit = 100 * nbcit / sum(nbcit))

        # message("restable ok") #dbg

        restable$valnames <- vlookup(restable$variable, searchtable = corrtable,
                                    searchcol = "variable", returncol = "valvect")
        restable$shortname <- vlookup(restable$variable, searchtable = corrtable,
                                      searchcol = "variable", returncol = "valshort")

        # message("restable ok22") #dbg
        # View(restable)
        # print(restable)

        ptable <- select(restable, valnames, nbcit, percases, percit, rangmed)
        colnames(ptable) <- c(valname, "citations", "% individus", "% citations", "rang median")


        lims <- restable$variable # to ensure both plots have the same cat order
        graphlabels <- as.character(restable$shortname) #short names, in the same order as lims

        # message("lims+graphlabels")
        # print(lims)
        # print(graphlabels) #d

        names(graphlabels) <- lims # (to be sure)

        # print(graphlabels)

        p1 <- ggplot(restable, aes(variable, percases)) +
                geom_bar(stat="identity") +
                scale_x_discrete(limits = rev(lims), labels = graphlabels) + #labels = graphlabels
                labs(y = "% individus", x = valname) +
                coord_flip()

        p2 <- ggplot(lresdf, aes(variable, value)) +
                geom_violin() +
                geom_jitter(height = 0.3, width = 0.5,
                            alpha = 0.4, color = "steelblue") +
                scale_x_discrete(labels = NULL,
                                 limits=rev(lims)) +
                labs(x = NULL, y = 'Rang citation') +
                coord_flip()

        make.result( name = prefix,
                     numcases = ncases,
                     ptable = ptable,
                     # plot = quote(multiplot(plot1, plot2, cols = 2)), # code
                     plot = quote(multiplot(plot1, plot2,
                                            layout = matrix(c(1, 1, 2), nrow = 1, byrow = TRUE))), # code
                     plot1 = p1,
                     plot2 = p2 )
}



# essai ==============================================================





#------------------------------------------------------------------------------

res <- mocat1(dataf = maindf,
              prefix = "situation_difficultes_",
              valvect = raisons,
              valshort = raisons_short,
              valname = "Raison")


windows(width = 12)
# eval(res$plot)
with(res, eval(plot))

dev.off()

View(res$ptable)
