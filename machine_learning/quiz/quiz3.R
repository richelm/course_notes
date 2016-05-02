# Question 1
# Load the cell segmentation data from the AppliedPredictiveModeling package 
# using the commands:

rm(list=ls())

library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

head(segmentationOriginal)

set.seed(125)
# subset data based on Case variable
training = segmentationOriginal[which(segmentationOriginal$Case == "Train"),]
testing = segmentationOriginal[which(segmentationOriginal$Case == "Test"),]
# check
summary(segmentationOriginal$Case)

modelFit <- train(Class ~ ., method="rpart", data=training)
modelFit$finalModel
library(rattle)
fancyRpartPlot(modelFit$finalModel)

# Question 2 - Answered from course slides and ISL


# Question 3
rm(list=ls())
library(pgmm)
data(olive)
olive = olive[,-1]
newdata = as.data.frame(t(colMeans(olive)))

modFit <- train(Area ~ ., method="rpart",data=olive)
modFit$finalModel
fancyRpartPlot(modFit$finalModel)
predict(modFit,newdata=newdata)


# Question 4

# Then set the seed to 13234 and fit a logistic regression model (method="glm", be 
# sure to specify family="binomial") with Coronary Heart Disease (chd) as the outcome 
# and age at onset, current alcohol consumption, obesity levels, cumulative tabacco, 
# type-A behavior, and low density lipoprotein cholesterol as predictors. 

# Calculate the misclassification rate for your model using this function and a 
# prediction on the "response" scale:
rm(list=ls())
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)
modFit <- train(chd ~ age+alcohol+obesity+tobacco+typea+ldl , method="glm",family="binomial",data=trainSA)

trainPredict <- predict(modFit, trainSA)
testPredict <- predict(modFit, testSA)
missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

missClass(trainSA$chd,trainPredict)
missClass(testSA$chd, testPredict)


# Question 5

library(ElemStatLearn)
rm(list=ls())
data(vowel.train)
data(vowel.test)
training <- as.data.frame(vowel.train)
testing <- as.data.frame(vowel.test)
training$y <- as.factor(training$y)
testing$y <- as.factor(testing$y)
set.seed(33833)
modFit <- train(y ~ ., method="rf", data=training, importance = TRUE)

varImp(modFit)


