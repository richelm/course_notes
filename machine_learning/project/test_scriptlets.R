# test scriptlets

m <- matrix(sample(c(NA, 1:10), 100, replace = TRUE), 10)
d <- as.data.frame(m)
d
d[is.na(d)] <- 0
d

d <- d[,-c(1,2)]
d