# README

This repository contains the files necessary for completing the Getting and Cleaning Data course project. The files are:

1. README.md - This file.

1. CodeBook.md - Code book for the output file, _means\_data.txt_, created by the _run\_analysis.R_ script.

1. run\_analysis.R - The R script file that performs all of the tidying and analysis for the project. Details in section below.

## Obtaining the data files

The data files were obtained in zip format from the course project page. The data files and associated documentation can also be obtained from the original source at:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Human Activity Recognition Using Smartphones Data Set")

The zip was copied to my R data directory and extracted there. The directory structure in the zip file was maintained. 

		~/Documents/R/data
		   |
		   +-- /UCI HAR Dataset   (this is the working directory)
				+-- activity_labels.txt
				+-- features.txt
				|
				+-- /test  (data files for test subjects)
				|     +-- subject_test.txt
				|     +-- X_test.txt
				|     +-- y_test.txt
				|
				+-- /train (data files for train subjects)
				      +-- subject_train.txt
				      +-- X_train.txt
				      +-- y_train.txt

		
## run\_analysis.R

All of the analysis is done in the single **run\_analysis.R** script. The script is divided into five sections.

1. **Initialization**
	* In this section working directory is set and any needed libraries are loaded. This is the only section you should have to modify for the script to work on your computer and R setup. Assumptions are:
		1. Set _working\_dir_ variable to your working directory.
		1. The data sets are in your working directory as outlined in above section.
		1. The _dplyr_ package is installed on your computer. This is the only package that is required.
		
1. **Read the activity and feature labels**
	* Read in the activity\_labels.txt and features.txt files located in the root working directory and store them in data frame activity\_labels and vector feature\_labels. Data frame  activity\_labels is used later in the _mutate_ function to apply the descriptive activity names and feature\_labels is used in the _col.names_ option of the of _read.table_ function to apply column names.
	
	* **NOTE:** The feature labels contain invalid characters for valid names as defined by R. The _make.names_ functions translates these characters to ".". This makes the names valid, but leaves two or more "." together and at the end. The _gsub_ function was used to clean this up. Here is my test case I used to get my head around all of this. 
	
				> x <- c("a..B","c..D..E.","ab.")
				> x
				[1] "a..B"     "c..D..E." "ab."     
				> y <- gsub("\\.+",".",x,perl=TRUE)
				> y
				[1] "a.B"    "c.D.E." "ab."   
				> y <- gsub("\\.$","",y,perl=TRUE)
				> y
				[1] "a.B"   "c.D.E" "ab" 
	
	A key thing to note is the need to use double backslash (\\\) to escape the "." in the regular expression.
	
1. **Read the test data files**
	* The data files for test subjects are expected to be in the _test_ folder under the working directory.
	
	* These messy datasets fall into the fifth most common problem as defined in the Hadley Wickham article Tidy Data. That is _a single observational unit is stored in multiple tables_. These are:
	
		* subject_test.txt: contains the subject ids for each observation.
		* X\_test.txt: contains the features (variables) for each observation.
		* y\_test.txt: contains the activity for each observation.
	
	* Each file is read into a data frame. The standard deviation (_std_) and and mean (_mean_) measurements are removed from the via the _select_ command. 
	
	* The final step in tidying the test data files is to _cbind_ them together and storing in the _test\_data_ data frame.
	
1. **Read the train data files**
	* The data files for train subjects are expected to be in the _train_ folder under the working directory.
	
	* The tidy process for these datasets is done exactly as is done with the test datasets.  Naming of variables is same with train replacing test. The multiple tables are:

		* subject\_train.txt: contains the subject ids for each observation.
		* X\_train.txt: contains the features (variables) for each observation.
		* y\_train.txt: contains the activity for each observation.
		
1. **Create independent tidy data set**
	* This final step was made easy by tidying up the original datasets. Three simple steps complete the analysis:
		1. Merge the tidy test and train data frames with _rbind_ function and store in project\_data.
		1. Create the means\_data data frame by applying _group\_by_ function to project\_data grouping by subject and activity columns. This is passed to _summarise\_each_ function to compute the mean of each feature.
		1. Write the means\_data frame to file means\_data.txt with the _write.table_ function.

-------
