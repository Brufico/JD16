

# Reponses
# =========

#' ### Colonnes sans réponses?
repcol <- sapply(maindf, function(col) sum(!is.na(col)))

#' génération liste variable avec * * pour le codebook
lvar <- factor(paste0("*", colnames(maindf), "* (", repcol, ")"))
lvar


# Questions à Reponses multiples
# ==============================

unique(maindf[["alternance_pas_proposition"]])

colnames(maindf)
