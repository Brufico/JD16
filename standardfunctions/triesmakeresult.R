
res1 <- make.result(name="aaa", numcases=55, plot1=NULL)
res2 <- make.result(name="bbb",
                    summaries = c(5,6),
                    plot1 = "zzz",
                    plot2=list(one="ioi" , two=list("000","111")),
                    numcases = 89,
                    plot3=NULL)

res1
res2
seq_along(res2)
names(res1)
names(res2)

res2[["plot1"]] <- "yyy"


addresult1 <- function(baseresult, moreresult , replace = FALSE) {
        for (i in seq_along(moreresult)) {
                namelt <- names(moreresult)[i]
                elt <- moreresult[i]
                # print(paste0("trace ", i))
                # print(namelt)
                # print(elt)
                if (namelt %in% names(baseresult)) {
                        if (replace) {
                                if (!is.null(elt)) {
                                        baseresult[[namelt]] <- elt
                                        #print("assigned\n")
                                }
                        }
                } else if (!is.null(elt)) {
                                baseresult[[namelt]] <- elt
                                #print("assigned\n")
                        }
                }

        baseresult
}


res3 <- addresult1(res1,res2)



addresult <- function(baseresult, ... , replace = FALSE) {
        for (i in seq_along(moreresult)) {
                namelt <- names(moreresult)[i]
                elt <- moreresult[i]
                # print(paste0("trace ", i))
                # print(namelt)
                # print(elt)
                if (namelt %in% names(baseresult)) {
                        if (replace) {
                                if (!is.null(elt)) {
                                        baseresult[[namelt]] <- elt
                                        #print("assigned\n")
                                }
                        }
                } else if (!is.null(elt)) {
                        baseresult[[namelt]] <- elt
                        #print("assigned\n")
                }
        }

        baseresult
}


getell <-  function(a, ...) {
        g <- list(...)
        print(g)
}

getell(2,b=3,c=5)
