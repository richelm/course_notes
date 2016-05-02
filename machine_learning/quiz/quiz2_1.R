# Quiz 2 - First Attempt
# load libraries for this quiz
library(caret)
library(AppliedPredictiveModeling)

# Question 1
# Load the Alzheimer's disease data using the commands:


data(AlzheimerDisease)

# Which of the following commands will create non-overlapping training and 
# test sets with about 50% of the observations assigned to each?

adData = data.frame(diagnosis,predictors)
testIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[-testIndex,]
testing = adData[testIndex,]

adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis,p=0.5,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

# Question 2

data(concrete)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

# ????

# Question 3

# Make a histogram and confirm the SuperPlasticizer variable is skewed. Normally 
# you might use the log transform to try to make the data more symmetric. 
# Why would that be a poor choice for this variable?
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

hist(training$Superplasticizer)
hist(log(training$Superplasticizer))
hist(log(training$Superplasticizer + 1))
log(0)
summary(training$Superplasticizer)

# Question 4

# Find all the predictor variables in the training set that begin with IL. Perform 
# principal components on these variables with the preProcess() function from the 
# caret package. Calculate the number of principal components needed to capture 80% of 
# the variance. How many are there?

set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training <- adData[ inTrain,]
testing <- adData[-inTrain,]
trainingIL <- adData[inTrain, grepl( "^IL" , names( adData ) ) ]
preProc <- preProcess(trainingIL,method="pca",thresh = 0.80)
preProc$rotation


# Question 5

# Create a training data set consisting of only the predictors with variable names 
# beginning with IL and the diagnosis. Build two predictive models, one using the 
# predictors as they are and one using PCA with principal components explaining 80% of 
# the variance in the predictors. Use method="glm" in the train function.

# What is the accuracy of each method in the test set? Which is more accurate?

set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
datacols <- grep("^IL", colnames(adData), value = TRUE)
datacols <- c(c="diagnosis",datacols)
adData2 <- adData[, datacols]
inTrain = createDataPartition(adData2$diagnosis, p = 3/4)[[1]]
training <- adData2[ inTrain,]
testing <- adData2[-inTrain,]

# train the data using the first method
modelFit <- train(diagnosis ~ ., method = "glm", data = training)
confusionMatrix(testing$diagnosis,predict(modelFit,testing))

# train the data using the second method
modelFit <- train(training$diagnosis ~ ., method = "glm",
            preProcess = "pca", data = training, 
            trControl = trainControl(preProcOptions = list(thresh = 0.8)))
confusionMatrix(testing$diagnosis, predict(modelFit, testing))


