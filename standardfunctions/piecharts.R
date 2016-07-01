

# "suppressPackageStartupMessages()" ==> check this out

library(ggplot2)

# First piechart

piechart <- function(data, mapping) {
        ggplot(data, mapping) +
                geom_bar(width = 1) +
                scale_x_discrete(labels=NULL, breaks=NULL)+
                scale_y_continuous(labels=NULL)+
        coord_polar(theta = "y") +
                xlab(NULL) +
                ylab(NULL)
}

piechart(mpg, aes(factor(1), fill = class))


# taking care of NSE
piechart1 <- function(data, var, ...) {
        piechart(data, aes_(~factor(1), fill = as.name(var)))
}


piechart1(mpg, "drv")




# Example of annotated Piechart

# ----------------------------------------------
# # --------------------------------------------

pie <- ggplot(mpg) +
        geom_bar(aes(x = 1, fill = factor(manufacturer)), width = 1, color="black") +
        scale_y_continuous("", labels = NULL, breaks=NULL) +
        scale_x_continuous("", labels = NULL, breaks=NULL) +
        scale_fill_discrete(guide = guide_legend(title = "cylinders")) +
        coord_polar(theta = "y")
pie

st <- ggplot_build(pie)
lbldf <- with(st$data[[1]], {
        xl <- xmin+ 1.1*(xmax-xmin)
        yl <- (ymax + ymin)/2
        perc <- 100 * round(count/sum(count) ,2)
        perclabs <- ifelse( perc > 9, paste0(as.character(perc),"%"), "")
        data.frame(xl, yl,perc, perclabs)
} )

pie +  geom_text(data = lbldf, aes(x=xl, y = yl, label = perclabs))


# ==================================================================
# back to building a piechart function

# taking care of NSE
#
# piechart0 <- function(data, nomvar, label = TRUE, minperc = 10, labpos = 1.1) {
#         piechart2(data, aes_(1, fill = as.name(nomvar)))
# }


aes(x = 1, fill = cyl)

v <- "cyl"
aes_(1, fill = as.name(v))

aes_(~factor(1), fill = as.name(v))


# -----------------------------------------------------------------------------------------------------------------

piechart1 <- function(data, mapping, nomscale, dolabel, minperc, labpos) {
        pie <- ggplot(data) +
                geom_bar(mapping, width = 1, color="black") +
                scale_x_continuous(labels=NULL, breaks=NULL) +
                scale_y_continuous(labels=NULL, breaks=NULL) +
                scale_fill_discrete(guide = guide_legend(title = nomscale)) +
                coord_polar(theta = "y") +
                xlab(NULL) +
                ylab(NULL)
        st <- ggplot_build(pie)
        lbldf <- with(st$data[[1]], {
                xl <- xmin+ labpos * (xmax-xmin)
                yl <- (ymax + ymin)/2
                perc <- 100 * round(count/sum(count) , 2)
                perclabs <- ifelse( perc > minperc, paste0(as.character(perc),"%"), "")
                data.frame(xl, yl,perc, perclabs)
        } )
        if (dolabel) {pie <- pie + geom_text(data = lbldf, aes(x=xl, y = yl, label = perclabs))}
        pie

}

# taking care of NSE
piechart <- function(data, var, nomscale = "", dolabel = TRUE, minperc = 10, labpos = 1.1) {
        piechart1(data, aes_(1, fill = as.name(var)), nomscale, dolabel, minperc, labpos)
}


piechart(mpg, "manufacturer", minperc = 4)




