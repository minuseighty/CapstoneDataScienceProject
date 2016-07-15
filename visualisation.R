## PLOTS

library(ggplot2)

frequency.plot <- function(data, heading, col) {
    ggplot(data[1:20, ], aes(x = seq(1:20), y = freq)) +
        geom_bar(stat = "identity", fill = col, width = 0.5) +
        coord_cartesian(xlim = c(1, 20)) +
        labs(title = heading) +
        xlab("Words") +
        ylab("Frequency") +
        scale_x_discrete(breaks = seq(1, 20, by = 1), labels = data$word[1:20]) +
        theme(axis.text.x = element_text(angle = 60, hjust = 1))
}

frequency.plot(df, "Top 20 Words", "skyblue")
frequency.plot(bi.df, "Top 20 2-gram Pairings", "forestgreen")
frequency.plot(tri.df, "Top 20 3-gram Pairings", "orange")
frequency.plot(quad.df, "Top 20 4-gram Pairings", "purple")