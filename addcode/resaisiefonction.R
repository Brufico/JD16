#' ---
#' title = "Matrice de re-saisie de fonction"
#' ---
#'

#' sourcer d'abord le code de prétraitement


fonctiondf <- data.frame(Code=repdf$Code,
                         fonction = repdf$votre_emploi_fonction,
                         activite = repdf$votre_emploi_activite,
                         stringsAsFactors = FALSE)

fonctiondf <- fonctiondf[which(!is.na(fonctiondf$fonction) | !is.na(fonctiondf$activite)),  ]



moredatadir <- "moredata"
if(!dir.exists(moredatadir)) {dir.create(moredatadir)}

fpath <- file.path(".", moredatadir, "refonction.csv")

write.table(fonctiondf, fpath, sep =";" , na = "", row.names = FALSE )


