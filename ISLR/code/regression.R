library(MASS)
library(ISLR)

names(Boston)
?Boston

plot(medv~lstat,Boston)

fit1<-lm(medv~lstat,data=Boston)
fit1
summary(fit1)
abline(fit1,col="red")

# confidence interval
confint(fit1)

# multiple linear regression
fit2<-lm(medv~lstat+age,data=Boston)
summary(fit2)

fit3<-lm(medv~.,data=Boston)
summary(fit3)
par(mfrow=c(2,2))
plot(fit3)


# plotting characters
par(mfrow=c(1,1))
plot(1:20,1:20,pch=1:20,cex=2)

fix(Carseats)
names(Carseats)