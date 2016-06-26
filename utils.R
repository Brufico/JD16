# vlookup
vlookup <- function(value, searchtable, searchcol = 1, returncol= 2){
        searchtable[match(value, searchtable[[searchcol]]), returncol]
}