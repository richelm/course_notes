# Getting and Cleaning Data Project Code Book

This is the code book for the Getting and Cleaning Data course project. The final independent data file is named _means\_data.txt_.
 
* **subject**
	* The subject id. There where 30 subjects total. Subject ids range from 1 to 30. The subjects were volunteers and ranged in age from 19 to 48 years.
	
* **activity**
	* One of six activities the subjects performed. These are
		* 1 - WALKING
		* 2 - WALKING\_UPSTAIRS
		* 3 - WALKING\_DOWNSTAIRS
		* 4 - SITTING
		* 5 - STANDING
		* 6 - LAYING
	The activity data files (y\_test.txt and y\_train.txt) contained only the ids 1 through 6. The _run\_analysis.R_ script used the _mutate_ function to add the descriptive text in the activity data.

* **features**

	The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

	Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

	Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

	These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

			tBodyAcc-XYZ
			tGravityAcc-XYZ
			tBodyAccJerk-XYZ
			tBodyGyro-XYZ
			tBodyGyroJerk-XYZ
			tBodyAccMag
			tGravityAccMag
			tBodyAccJerkMag
			tBodyGyroMag
			tBodyGyroJerkMag
			fBodyAcc-XYZ
			fBodyAccJerk-XYZ
			fBodyGyro-XYZ
			fBodyAccMag
			fBodyAccJerkMag
			fBodyGyroMag
			fBodyGyroJerkMag

	The features in the means\_data.txt file are the means of each original feature (standard deviation (std) and mean (mean) only) by subject and activity. These were not labeled with an additional _"mean"_ at the end. Rather, to remain consistent with the source data, the original feature names were used. 
	
	The original feature names contain invalid characters for valid names as defined by R. The _make.names_ functions translates these characters to ".". This makes the names valid, but leaves two or more "." together and at the end. The _gsub_ function was used to clean this up. Here is example R code to illustrate how this impacted the original feature names.
	
			> x <- c("tBodyAccMag-mean()","tBodyAcc-std()-Y","fBodyAcc.std.X")
			> x
			[1] "tBodyAccMag-mean()" "tBodyAcc-std()-Y"   "fBodyAcc.std.X"    
			> x <- make.names(x)
			> x
			[1] "tBodyAccMag.mean.." "tBodyAcc.std...Y"   "fBodyAcc.std.X"    
			> x <- gsub("\\.+",".",x,perl=TRUE)
			> x
			[1] "tBodyAccMag.mean." "tBodyAcc.std.Y"    "fBodyAcc.std.X"   
			> x <- gsub("\\.$","",x,perl=TRUE)
			> x
			[1] "tBodyAccMag.mean" "tBodyAcc.std"     "fBodyAcc.std"    
			> 
	
	This is a complete list of features in means\_data.txt data file.
	
				tBodyAcc.mean.X
				tBodyAcc.mean.Y
				tBodyAcc.mean.Z
				tBodyAcc.std.X
				tBodyAcc.std.Y
				tBodyAcc.std.Z
				tGravityAcc.mean.X
				tGravityAcc.mean.Y
				tGravityAcc.mean.Z
				tGravityAcc.std.X
				tGravityAcc.std.Y
				tGravityAcc.std.Z
				tBodyAccJerk.mean.X
				tBodyAccJerk.mean.Y
				tBodyAccJerk.mean.Z
				tBodyAccJerk.std.X
				tBodyAccJerk.std.Y
				tBodyAccJerk.std.Z
				tBodyGyro.mean.X
				tBodyGyro.mean.Y
				tBodyGyro.mean.Z
				tBodyGyro.std.X
				tBodyGyro.std.Y
				tBodyGyro.std.Z
				tBodyGyroJerk.mean.X
				tBodyGyroJerk.mean.Y
				tBodyGyroJerk.mean.Z
				tBodyGyroJerk.std.X
				tBodyGyroJerk.std.Y
				tBodyGyroJerk.std.Z
				tBodyAccMag.mean
				tBodyAccMag.std
				tGravityAccMag.mean
				tGravityAccMag.std
				tBodyAccJerkMag.mean
				tBodyAccJerkMag.std
				tBodyGyroMag.mean
				tBodyGyroMag.std
				tBodyGyroJerkMag.mean
				tBodyGyroJerkMag.std
				fBodyAcc.mean.X
				fBodyAcc.mean.Y
				fBodyAcc.mean.Z
				fBodyAcc.std.X
				fBodyAcc.std.Y
				fBodyAcc.std.Z
				fBodyAcc.meanFreq.X
				fBodyAcc.meanFreq.Y
				fBodyAcc.meanFreq.Z
				fBodyAccJerk.mean.X
				fBodyAccJerk.mean.Y
				fBodyAccJerk.mean.Z
				fBodyAccJerk.std.X
				fBodyAccJerk.std.Y
				fBodyAccJerk.std.Z
				fBodyAccJerk.meanFreq.X
				fBodyAccJerk.meanFreq.Y
				fBodyAccJerk.meanFreq.Z
				fBodyGyro.mean.X
				fBodyGyro.mean.Y
				fBodyGyro.mean.Z
				fBodyGyro.std.X
				fBodyGyro.std.Y
				fBodyGyro.std.Z
				fBodyGyro.meanFreq.X
				fBodyGyro.meanFreq.Y
				fBodyGyro.meanFreq.Z
				fBodyAccMag.mean
				fBodyAccMag.std
				fBodyAccMag.meanFreq
				fBodyBodyAccJerkMag.mean
				fBodyBodyAccJerkMag.std
				fBodyBodyAccJerkMag.meanFreq
				fBodyBodyGyroMag.mean
				fBodyBodyGyroMag.std
				fBodyBodyGyroMag.meanFreq
				fBodyBodyGyroJerkMag.mean
				fBodyBodyGyroJerkMag.std
				fBodyBodyGyroJerkMag.meanFreq


Complete details of the source data files and data elements can be found at: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Human Activity Recognition Using Smartphones Data Set")
