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
data(vowel.train)
data(vowel.test)
training <- as.data.frame(vowel.train)
testing <- as.data.frame(vowel.test)
training$y <- as.factor(training$y)
testing$y <- as.factor(testing$y)
set.seed(33833)
mod1 <- train(y ~ ., method="rf", data=training)
mod2 <- train(y ~ ., method="gbm", data=training)
testPred1 <- predict(mod1,testing)
postResample(testPred1, testing$y)
testPred2 <- predict(mod2, testing)
postResample(testPred2, testing$y)

# What are the accuracies for the two approaches on the test data set? What is the 
# accuracy among the test set samples where the two methods agree? 

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

# (N) A. Stacked Accuracy: 0.76 is better than random forests and boosting, but not lda.
# B. Stacked Accuracy: 0.80 is better than random forests and lda and the same as boosting.
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

# Set the seed to 233 and fit a lasso model to predict Compressive 
# Strength. Which variable is the last coefficient to be set to zero 
# as the penalty increases? (Hint: it may be useful to look up ?plot.enet).

# A. BlastFurnaceSlag
# (N) B. FineAggregate
# C. CoarseAggregate
# D. Cement


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
# C. 96%
# (N) D. 93%


# Question 5
#
# Load the concrete data with the commands:

rm(list=ls())
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

# Set the seed to 325 and fit a support vector machine using the e1071 
# package to predict Compressive Strength using the default settings. 
# Predict on the testing set. What is the RMSE?

# A. 6.93
# (Y) B. 6.72 <<<
# C. 107.44
# D. 11543.39
