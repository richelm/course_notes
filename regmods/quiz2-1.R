# Regression Models - Quiz 2 


# 1. Find P-value for beta1

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
summary(fit)

# Answer: 0.05296

# 2. Consider the previous problem, give the estimate of the residual standard deviation.

e <- residuals(fit)
n <- length(y)
sde <- sqrt(sum(e^2) / (n -2))
sde

# Answer: 0.2229981

# 3. In the mtcars data set, fit a linear regression model of weight (predictor) on 
# mpg (outcome). Get a 95% confidence interval for the expected mpg at the average 
# weight. What is the lower endpoint?

y <- mtcars$mpg
x <- mtcars$wt
fit <- lm(y ~ x)
m <- mean(mtcars$wt)
predict(fit, newdata = data.frame(x = m), interval = "confidence")

# Answer: 18.991

# 4. 
# Answer: The estimated expected change in mpg per 1,000 lb increase in weight.

# 5. Consider again the mtcars data set and a linear regression model with mpg as 
# predicted by weight (1,000 lbs). A new car is coming weighing 3000 pounds. 
# Construct a 95% prediction interval for its mpg. What is the upper endpoint?

y <- mtcars$mpg
x <- mtcars$wt
fit <- lm(y ~ x)
predict(fit, newdata = data.frame(x = 3), interval = "prediction")

# 6 Consider again the mtcars data set and a linear regression model with mpg as 
# predicted by weight (in 1,000 lbs). A short ton is defined as 2,000 lbs. 
# Construct a 95% confidence interval for the expected change in mpg per 1 short 
# ton increase in weight. Give the lower endpoint.

y <- mtcars$mpg
x <- mtcars$wt
fit <- lm(y ~ x)
sumCoef <- summary(fit)$coefficients
#sumCoef
# intercept
#sumCoef[1,1]/2 + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[1, 2]

# slope
sumCoef[2,1]*2 + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[2, 2]*2

# 9. 
x <- mtcars$wt
y <- mtcars$mpg
fit <- lm(y ~ x)
yhat <- predict(fit)
rse1 <- sum((y - yhat)^2)

fit <- lm(y ~ 1)
yhat <- predict(fit)
rse2 <- sum((y - yhat)^2)
rse1/rse2
