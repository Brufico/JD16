
# Input the ad data
ad = data.frame(
        type = c("Poster", "Billboard", "Bus", "Digital"),
        n = c(529, 356, 59, 81)
)

# Bar plot
library(ggplot2)
ggplot(data = ad, aes(x = type, y = n, fill = type)) +
        geom_bar(stat = "identity", show.legend = FALSE) +
        theme_bw()


# pie chart ????
library(ggplot2)
ggplot(data = ad, aes(x = type, y = n, fill = type)) +
        geom_bar(stat = "identity", show.legend = FALSE) +
        theme_bw()+
        coord_polar(theta = "y")



# Add addition columns to data, needed for donut plot.
ad$fraction = ad$n / sum(ad$n)
ad$ymax = cumsum(ad$fraction)
ad$ymin = c(0, head(ad$ymax, n = -1))

# Donut plot
ggplot(data = ad, aes(fill = type, ymax = ymax, ymin = ymin, xmax = 4, xmin = 3)) +
        geom_rect(colour = "grey30", show_guide = FALSE) +
        coord_polar(theta = "y") +
        xlim(c(0, 4)) +
        theme_bw() +
        theme(panel.grid=element_blank()) +
        theme(axis.text=element_blank()) +
        theme(axis.ticks=element_blank()) +
        geom_text(aes(x = 3.5, y = ((ymin+ymax)/2), label = type)) +
        xlab("") +
        ylab("")
