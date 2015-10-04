# ----------------------------------------------------------------------------
# Standard error sample mean
m = 
s = 
n = 
se = s/sqrt(n)

# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Standard error of differnce of sample means.

m1
m2
s1
s2
n1
n2
se = sqrt(s1^2/n1 + s2^2/n2)
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# pooled sample standard error
n1
n2
s1
s2
sp = sqrt(((n1-1)*s1^2 + (n2-1)*s2^2)/(n1+n2-2))

# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Z confidence interval
m
n
s

m + c(-1,1) * qnorm(0.975)*s/sqrt(n)

# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Z conf interval for sample proportions (ie each Xi is 0 or 1)
# Example: 
# Random sample of 100 likely voters, 56 intend to vote for you. What is a 95%
# confidence interval?
p <- 0.56
n <- 100
p + c(-1,1)*qnorm(0.975) * sqrt(p*(1-p)/n)

# with binom.test
binom.test(56,100)$conf.int

# ----------------------------------------------------------------------------
# Poisson interval
# Example:
# A nuclear pump failed 5 times out of 94.32 days. Give a 95% confidence 
# interval for the failure rate per day.

x <- 5
t <- 94.32
lambda <- x/t

lambda + c(-1,1) * qnorm(0.975) * sqrt(lambda/t)

# ----------------------------------------------------------------------------

# 