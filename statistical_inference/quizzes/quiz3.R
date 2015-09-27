# question 4
n1 <- n2 <- 10


#spsq <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
#round(spsq,2)

x1 <- 3  # new mean
s1 <- sqrt(0.60) # new sd
x2 <- 5  # old mean
s2 <- sqrt(0.68) # old sd
s = (s1^2 + s2^2)/2
n = 10
x1-x2 + c(-1,1)*qt(0.975, 9) * s/sqrt(n)

# =======================================================
# Question 6

s = (0.5^2 + 2^2)/2
n = 100
(6-4)+c(-1,1)*qnorm(0.975)*s/sqrt(n)


# =======================================================
# Question 7

n <- 9
xt <- -3
xp <- 1
st <- 1.5
sp <- 1.8
s <- (st^2 + sp^2)/2
round(xt-xp + c(-1,1)*qt(0.95, 16)*s/sqrt(n),3)


