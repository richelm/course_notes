setwd("/home/richs/Documents/course_notes/ISLR")

Auto=read.table("data/Auto.data",header = TRUE, na.strings = "?")

# view the data frame in a spreadsheet like window
fix(Auto)

# get dimension of data frame (row, columns)
dim(Auto)

# get names of the c
