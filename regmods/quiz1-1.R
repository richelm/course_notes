# QUIZ 1 - Attempt 1

# question 1
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
sum(x*w)/sum(w)

# question 2
# y is outcome, x predictor, fit regression through origin and find slope
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
# cor(x,y)*(sd(x)/sd(y))
fit <- lm(x ~ y, -1)
coef(fit)[2]

# question 3
library(UsingR)
data("mtcars")
y <- mtcars$mpg
x <- mtcars$wt
beta1 <- cor(y, x) *  sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)
rbind(c(beta0, beta1), coef(lm(y ~ x)))

# question 4 done on paper

# question 5
# y is outcome and x predictor cor = 0.4 q1 = 1.5 q2 = 1.5 * 0.4 = 0.6

# question 6
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
xn <- (x - mean(x)) / sd(x)
c(mean(xn),sd(xn),xn[1])

# question 7
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
fit <- lm(y ~ x)
coef(fit)[1]


# question 8 figured out on paper

# question 9
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
sum(x)/length(x)