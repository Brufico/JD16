
#'fonctionpourenregistrerlesrésultats
#'===================================


#'fonctionpourenregistrerlesrésultats

#initialisation
allresults <- list(Whatsit="List of Results")

setresult <- function(rname,rres=res){
        allresults[[rname]] <<- rres
}

getresult <- function(rname){
        allresults[[rname]]
}

