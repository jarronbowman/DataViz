install.packages("devtools")
install.packages("ggplot2")
library(ggplot2)
library(devtools)
gapminder.url <- "https://raw.githubusercontent.com/socviz/soc880/master/data/gapminder.csv"
data <- read.csv(url(gapminder.url))
dim(data)
p <- ggplot(data,
            aes(x=gdpPercap,
                y=lifeExp))
p + geom_point() + geom_smooth(method="loess")
p + geom_point() + geom_smooth(method="lm")
p + geom_point() + geom_smooth()
p + geom_point() + geom_smooth(method="loess") + scale_x_log10()
p + geom_point(color="dark blue") + geom_smooth(method="loess") + scale_x_log10()
p <- ggplot(data,
            aes(x=gdpPercap,
                y=lifeExp,
                color=continent))
p + geom_point() + scale_x_log10()
p <- ggplot(data,
            aes(x=gdpPercap,
                y=lifeExp,
                color=continent,
                fill=continent,
                size=pop))
p + geom_point(aes(color=continent)) + geom_smooth(method="loess") + scale_x_log10()
africa.only <- data$continent=="Africa"
str(africa.only)
class(africa.only)
p + geom_point() + scale_x_log10() + scale_color_brewer(palette="Dark2") + scale_fill_brewer(palette="Dark2")

p + geom_line()
p + geom_bar(stat="identity")
p <- ggplot(data, aes(x=year, y=lifeExp))
p1 <- p + geom_line(color="gray69", aes(group=country)) + geom_smooth(size=1.1, method="loess")
p1 + facet_wrap(~ continent, ncol=6) + labs(x="Year", y="Life Expectancy")
p1 + facet_grid(~ continent) + labs(x="Year", y="Life Expectancy")
