# test scriptlets

m <- matrix(sample(c(NA, 1:10), 100, replace = TRUE), 10)
d <- as.data.frame(m)
d
d[is.na(d)] <- 0
d

d <- d[,-c(1,2)]
d
m

r1 <- c(1,2,3)
r2 <- c(2,3,4)
r3 <- c(3,4,5)
ms <- as.data.frame(rbind(r1,r2,r3))
colnames(ms) <- c("col1","col2","col3")
row.names(ms) <- c("row1","row2","row3")
ms
