# -------------------------------------------------------------------
# FILE: run_analysis.R
# 
# R script to perform analysis for the Getting and Cleaning Data
# course project. You should be able to take this script and run
# against the same data sets on your computer. To do this you 
# only need to change the working_dir variable to location on your 
# computer. The directory structure in the zip archive was kept.
#
# -------------------------------------------------------------------
# CHANGELOG:
# 2015-04-25 File created.
# 2015-04-26 Final edits and comments
# -------------------------------------------------------------------

# *******************
# * Initializations *
# *******************

# set working_dir variable
working_dir <- "~/Documents/R/data/UCI\ HAR\ Dataset"

# set working directory
setwd(working_dir)

# load libraries
library(dplyr)


# ****************************************
# * Read the activity and feature labels *
# ****************************************
# activities
activity_labels <- read.table(
  file="activity_labels.txt",
  col.names = c("id","activity"),
  header = FALSE)

# features
feature_labels <- read.table(
  file = "features.txt",
  col.names = c("id","feature"),
  header = FALSE)

# clean up the feature labels
feature_labels <- make.names(feature_labels$feature)
feature_labels <- gsub("\\.+",".",feature_labels,perl=TRUE)
feature_labels <- gsub("\\.$","",feature_labels,perl=TRUE)


# ****************************
# * Read the test data files *
# ****************************
# Note: 
# Column headings are added when data is read via
# the col.names option of read.table

# subjects
subject_test <- read.table(
  file = "test/subject_test.txt",
  col.names = c("subject"),
  header = FALSE)

# activities
activity_test <- read.table(
  file = "test/y_test.txt",
  col.names = c("id"),
  header = FALSE)

# change the ids to labels and then remove id column
activity_test <- mutate(activity_test, activity = activity_labels$activity[activity_test$id])
activity_test$id <- NULL

# features
test_features <- read.table(
  file = "test/X_test.txt",
  col.names = feature_labels,
  header = FALSE)

# keep only std and mean features
test_mean_std <- select(test_features,matches("std|mean",ignore.case=FALSE))

# merge test data together
test_data <- cbind(subject_test,activity_test,test_mean_std)


# *****************************
# * Read the train data files *
# *****************************
# Note: 
# Column headings are added when data is read via
# the col.names option of read.table

# subjects
subject_train <- read.table(
  file = "train/subject_train.txt",
  col.names = c("subject"),
  header = FALSE)

# activities
activity_train <- read.table(
  file = "train/y_train.txt",
  col.names = c("id"),
  header = FALSE)

# change the ids to labels and then remove id column
activity_train <- mutate(activity_train, activity = activity_labels$activity[activity_train$id])
activity_train$id <- NULL

# features
train_features <- read.table(
  file = "train/X_train.txt",
  col.names = feature_labels,
  header = FALSE)

# keep only std and mean features
train_mean_std <- select(train_features,matches("std|mean",ignore.case=FALSE))

# merge train data together
train_data <- cbind(subject_train,activity_train,train_mean_std)


# ************************************
# * Create independent tidy data set *
# ************************************

# merge together test and train data
project_data <- rbind(test_data,train_data)

# find the mean of each variable grouped by subject and activity
means_data <- project_data %>% group_by(subject,activity) %>% summarise_each(funs(mean))

# write out means_data to file
write.table(means_data,"means_data.txt",row.names = FALSE)
