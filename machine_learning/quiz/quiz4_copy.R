# Quiz 4 - Machine Learning
# http://machinelearningmastery.com/how-to-estimate-model-accuracy-in-r-using-the-caret-package/
library(caret)

# -----------------------------------------------------------------------------
# Question 1
#

# Load the vowel.train and vowel.test data sets:

# Set the variable y to be a factor variable in both the training and test set. Then 
# set the seed to 33833. Fit (1) a random forest predictor relating the factor 
#variable y to the remaining variables and (2) a boosted predictor using the 
# "gbm" method. Fit these both with the train() command in the caret package.

rm(list=ls())
library(ElemStatLearn)
vowel.train$y = as.factor(vowel.train$y)
vowel.test$y = as.factor(vowel.test$y)

set.seed(33833)
# random forest
rf.mod <- train(y~., method="rf", data=vowel.train)
rf.predict <- predict(rf.mod, newdata = vowel.test)
confusionMatrix(data=rf.predict, vowel.test$y)$overall['Accuracy']

# gbm (boosted predictor)
gbm.mod <- train(y ~ ., method="gbm", data=vowel.train)
gbm.predict <- predict(gbm.mod, newdata = vowel.test)
confusionMatrix(data=gbm.predict, vowel.test$y)$overall['Accuracy']

# agreement between two
idx_agreed <- (rf.predict == gbm.predict)
confusionMatrix(vowel.test$y[idx_agreed], rf.predict[idx_agreed])$overall['Accuracy']

# What are the accuracies for the two approaches on the test data set? What is the 
# accuracy among the test set samples where the two methods agree? 
# RF: 0.6147186; GBM: 0.5367965; AGREEMENT: 0.6656051 
# (Y) A. RF Accuracy = 0.6082; GBM Accuracy = 0.5152; Agreement Accuracy = 0.6361
# B. RF Accuracy = 0.9987; GBM Accuracy = 0.5152; Agreement Accuracy = 0.9985
# C. RF Accuracy = 0.6082; GBM Accuracy = 0.5152; Agreement Accuracy = 0.5152
# D. RF Accuracy = 0.9881; GBM Accuracy = 0.8371; Agreement Accuracy = 0.9983


# -----------------------------------------------------------------------------
# Question 2

# Load the Alzheimer's data using the following commands
rm(list=ls())
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

# Set the seed to 62433 and predict diagnosis with all the other 
# variables using a random forest ("rf"), boosted trees ("gbm") and 
# linear discriminant analysis ("lda") model. Stack the predictions 
# together using random forests ("rf"). What is the resulting accuracy 
# on the test set? Is it better or worse than each of the individual predictions?
set.seed(62433)
# rf
rf.mod <- train(diagnosis~.,method="rf",data=training)
rf.predict <- predict(rf.mod, newdata=testing)
confusionMatrix(data=rf.predict, testing$diagnosis)$overall['Accuracy']

# gbm
gbm.mod <- train(diagnosis~.,method="gbm",data=training)
gbm.predict <- predict(gbm.mod, newdata=testing)
confusionMatrix(data=gbm.predict, testing$diagnosis)$overall['Accuracy']

# lda
lda.mod <- train(diagnosis~.,method="lda",data=training)
lda.predict <- predict(lda.mod, newdata=testing)
confusionMatrix(data=lda.predict, testing$diagnosis)$overall['Accuracy']

rf.predict <- predict(train(diagnosis~.,method="rf",data=training),newdata=testing)
gbm.predict <- predict(train(diagnosis~.,method="gbm",data=training),newdata=testing)
lda.predict <- predict(train(diagnosis~.,method="lda",data=training),newdata=testing)

# stacked
predDF <- data.frame(rf.predict,gbm.predict,lda.predict,diagnosis=testing$diagnosis)
combModFit <- train(diagnosis~.,method="rf",data=predDF)
combPred <- predict(combModFit,predDF)
confusionMatrix(data=combPred, testing$diagnosis)$overall['Accuracy']

summary(rf.predict)
summary(gbm.predict)
summary(lda.predict)
summary(testing$diagnosis)
head(predDF)

# RF: 0.7682927; GBM: 0.804878; LDA: 0.7682927; Stacked: 0.8292683 

# (N) A. Stacked Accuracy: 0.76 is better than random forests and boosting, but not lda.
# (X) B. Stacked Accuracy: 0.80 is better than random forests and lda and the same as boosting.
# C. Stacked Accuracy: 0.76 is better than lda but not random forests or boosting.
# D. Stacked Accuracy: 0.80 is better than all three other methods


# -----------------------------------------------------------------------------
# Question 3
#
# Load the concrete data with the commands:
rm(list=ls())
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)
mod <- train(CompressiveStrength~.,method="lasso",data=training)
plot.enet(mod$finalModel, xvar="penalty", use.color=T)


# Set the seed to 233 and fit a lasso model to predict Compressive 
# Strength. Which variable is the last coefficient to be set to zero 
# as the penalty increases? (Hint: it may be useful to look up ?plot.enet).

# A. BlastFurnaceSlag
# (N) B. FineAggregate
# C. CoarseAggregate
# (X) D. Cement


# -----------------------------------------------------------------------------
# Question 4
#
# Load the data on the number of visitors to the instructors blog from here:
# https://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv
# Using the commands:

rm(list=ls())
library(lubridate) # For year() function below
dat = read.csv("~/Documents/courses/machine_learning/quiz/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

# Fit a model using the bats() function in the forecast package to the 
# training time series. Then forecast this model for the remaining time 
# points. For how many of the testing points is the true value within 
# the 95% prediction interval bounds?

# A. 94%
# B. 95%
# (X) C. 96%
# (N) D. 93%

library(forecast)
fit <- bats(tstrain)

upper <- fitted(fit) + 1.96*sqrt(fit$variance)
lower <- fitted(fit) - 1.96*sqrt(fit$variance)

fcast <- forecast(ts_mod, h=dim(testing)[1], level=95, fan=FALSE, biasadj=FALSE)
accuracy(fcast,testing$visitsTumblr)
plot(fcast)

# Question 5
#
# Load the concrete data with the commands:

rm(list=ls())
set.seed(3523)
library(AppliedPredictiveModeling)
library(caret)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

# Set the seed to 325 and fit a support vector machine using the e1071 
# package to predict Compressive Strength using the default settings. 
# Predict on the testing set. What is the RMSE?

library(e1071)
set.seed(325)
modfit <- svm(CompressiveStrength~., data=training)
pred <- predict(modfit, newdata = testing)
accuracy(pred,testing$CompressiveStrength)
pred$RMSE
confusionMatrix(data=pred, testing$CompressiveStrength)$overall
# A. 6.93
# (Y) B. 6.72 <<<
# C. 107.44
# D. 11543.39

