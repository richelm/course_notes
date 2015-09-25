

mean_distro <- NULL
for (i in 1 : 1000) mean_distro = c(mean_distro, mean(rexp(40,0.2)))

g <- ggplot(data.frame(mean_distro = mean_distro), aes(mean_distro))
g <- g + geom_histogram(color = "black", fill = "lightblue", binwidth = 0.05)
g
g <- g + geom_density(aes(y = ..scaled..))
g <- g + stat_function(fun = dnorm, size = 2)
g

mu <- 5
se <- 5/sqrt(40)

cfunc <- function(x n) sqrt(n) * (x - mu) / se
std_mean_distro <- sapply(mean_distro, cfunc, 40)
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


# ======================================================================
nosim <- 1000
cfunc <- function(x, n) sqrt(n) * (mean(x) - 3.5) / 1.71
dat <- data.frame(
  x = c(apply(matrix(sample(1 : 6, nosim * 40, replace = TRUE), 
                     nosim), 1, cfunc, 40)
  ),
  size = factor(rep("40", nosim)))

g <- ggplot(dat, aes(x = x, fill = size))
g <- g + geom_histogram(alpha = .20, binwidth=.3, colour = "black", aes(y = ..density..)) 
g <- g + stat_function(fun = dnorm, size = 2)
g + facet_grid(. ~ size)


# ======================================================================
n=10000
means <- cumsum(sample(0:1, n, replace = TRUE))/(1:n)
g <- ggplot(data.frame(x = 1:n, y = means), aes(x = x, y = y))
g <- g + geom_hline(yintercept = 0.5) + geom_line(size = 2)
g <- g + labs(x = "Number of obs", y = "Cumulative mean")
g


# ======================================================================
#hist(rexp(1000,0.2), col="lightgreen")

dat <- data.frame(x = rexp(1000,0.2), size = factor(rep("40", 1000)))

g <- ggplot(dat, aes(x = x, fill = size))
g <- g + geom_histogram(alpha = .20, binwidth=.3, colour = "black", aes(y = ..density..)) 
g


# ======================================================================
dat <- data.frame(Exponential_Sample_Data = rexp(1000,0.2))
ggplot(dat, aes(x=Exponential_Sample_Data)) + geom_histogram(binwidth=.5, colour="black", fill="lightgreen")


# ======================================================================
nosim <- 1000
cfunc <- function(x, n) sqrt(n) * (x - 5) / 5
dat <- data.frame(
  x = sapply(mean_distro, cfunc, 40),
  size = factor(rep("40", nosim)))

g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth=.3, colour = "black", aes(y = ..density..)) 
g <- g + stat_function(fun = dnorm, size = 2)
g + facet_grid(. ~ size)
