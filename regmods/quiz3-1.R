# Regreesion Models Quiz 3

library(UsingR)

# 1.
data("mtcars")
#head(mtcars)
fit <- lm(mpg ~ I(as.factor(cyl)) + wt, data=mtcars)
summary(fit)

# 2.
# adjusted fit includes weight variable
afit <- lm(mpg ~ I(as.factor(cyl)) + wt, data=mtcars)

# unadjusted fit does not include weight variable
uafit <- lm(mpg ~ I(as.factor(cyl)) + wt, data=mtcars)

summary(afit)
summary()