

mean_distro <- NULL
for (i in 1 : 1000) mean_distro = c(mean_distro, mean(rexp(40,0.2)))

g <- ggplot(data.frame(mean_distro = mean_distro), aes(mean_distro))
g <- g + geom_histogram(color = "black", fill = "lightblue", binwidth = 0.05)
g <- g + geom_density(aes(y = ..scaled..))
g <- g + stat_function(fun = dnorm, size = 2)
g

library(ggplot2)
library(datasets)

gg <- ggplot(mtcars, aes(x=mpg))
gg <- gg + geom_histogram(binwidth=2, colour="black", 
                          aes(y=..density.., fill=..count..))
gg <- gg + scale_fill_gradient("Count", low="#DCDCDC", high="#7C7C7C")
gg <- gg + stat_function(fun=dnorm,
                         color="red",
                         arg=list(mean=mean(mtcars$mpg), 
                                  sd=sd(mtcars$mpg)))

gg