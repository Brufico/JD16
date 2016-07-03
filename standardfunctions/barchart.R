library(ggplot2)

# bar chart
# data+aes

barchart <- function(dataf,
                     nomvar,
                     useNA = "no",
                     #digits = sfdefault("digits"),
                     rfreq = TRUE,
                     barwidth = sfdefault("discretebarwidth"),
                     cfill = sfdefault("filldefault") ) {
        # data+aes
        if (useNA == "no") {
                dataf <- dataf[which(!is.na(dataf[[nomvar]])),]
        }
        if (rfreq) {
                pt <- ggplot(dataf,
                             aes_(as.name(nomvar),
                                  quote(
                                          100 * ..count.. / sum(..count..)
                                  )))
        } else {
                pt <- ggplot(dataf,
                             aes_(as.name(nomvar)))
        }
        # geom
        pt <- pt + geom_bar(width = barwidth, fill = cfill)
        # ylabel
        if (rfreq) {
                pt <- pt + ylab("percent")
        }
        pt
}


barchart(mpg,"drv")
barchart(mpg,"trans")
