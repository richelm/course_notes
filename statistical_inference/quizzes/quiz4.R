# question 1
b <- c(140, 138, 150, 148, 135)
w2 <- c(132, 135, 151, 146, 130)

t.test(b,w2,paired = TRUE)$p.value

# question 2
mu <- 1100
s <- 30
n <- 9
df <- n - 1
mu + c(-1,1) * qt(0.975, df, lower.tail = FALSE)*s/sqrt(n)

# question 3
n <- 4
mu0 <- 2
mua <- 3

# question 4
ppois(1787-1,.01*1787,lower.tail = FALSE)

# question 5
mt <- -3
mp <- 1
st <- 1.5
sp <- 1.8
s <- st - sp
(mt - mp) + c(-1,0)*qt(0.95,8)*s/sqrt(9)

# question 6

# question 7
n = 100
mu = 0.01
sd = 0.04
mu + qnorm(0.975)*sd/sqrt(n)

# question 8
library(pwr)
h = 0
n = NULL
p = 90
sl = 0.05
pwr.2p.test(h=0, n=NULL, sig.level = 0.05, power=0.90,alternative = "greater")


power.t.test(delta=0.0,sd=0.04,power=0.9,type = "one.sample",alternative = "one.sided")

(qnorm(.95) + qnorm(.9)) ^ 2 * .04 ^ 2 / .01^2
(qnorm(.95) + qnorm(.8)) ^ 2 * .04 ^ 2 / .01^2

alpha = 0.05
mu0 = 0.01
mua = 0.02
sigma = 0.04
n = 140
z = qnorm(1 - alpha)
pnorm(mu0 + z * sigma/sqrt(n), mean = mua, sd = sigma/sqrt(n), lower.tail = FALSE)

