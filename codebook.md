# Codebook for Coursera / JHU Data Science / Getting and Cleaning Data

This codebook describes how the data is organized.

The original data is split into three different files, additionally split across testing / training datasets:

subject_[test/train].txt = the row index of subjects
y_[test/train].txt = row index of activities (one of six)
X_[test/train].txt = a matrix of 561 columns, which are features that the sensor collects

The purpose of the code is to take the subject_ and y_ txt files and combine them with X_ into a dataset of columns. In the tidied up file, "X_avg.txt", the columns are as follows:

* Subjects: 30 participants, labelled from 1 -> 30
* Group: Test or Train
* Activity: Standing, Sitting, Laying, Walking, Walking_Downstairs, Walking_Upstairs

The next 66 features are given as averages for each activity, because in the original dataset there many separate measures for, say, Subject 1 doing activity "Walking". t stands for data derived from time sampling, while f is for frequency based (fft) analysis - which I assume to mean the dominant frequency in a frequency spectrum. I did not attempt to make the names any more verbose. The numbers are normalized in the range [-1,1], in units of g (-9.81 m/s^2)

* tBodyAcc-mean-X 
* tBodyAcc-mean-Y 
* tBodyAcc-mean-Z 
* tGravityAcc-mean-X 
* tGravityAcc-mean-Y 
* tGravityAcc-mean-Z 
* tBodyAccJerk-mean-X 
* tBodyAccJerk-mean-Y 
* tBodyAccJerk-mean-Z 
* tBodyGyro-mean-X 
* tBodyGyro-mean-Y 
* tBodyGyro-mean-Z
* tBodyGyroJerk-mean-X 
* tBodyGyroJerk-mean-Y 
* tBodyGyroJerk-mean-Z 
* tBodyAccMag-mean 
* tGravityAccMag-mean 
* tBodyAccJerkMag-mean 
* tBodyGyroMag-mean 
* tBodyGyroJerkMag-mean 
* fBodyAcc-mean-X 
* fBodyAcc-mean-Y 
* fBodyAcc-mean-Z 
* fBodyAccJerk-mean-X 
* fBodyAccJerk-mean-Y 
* fBodyAccJerk-mean-Z 
* fBodyGyro-mean-X 
* fBodyGyro-mean-Y 
* fBodyGyro-mean-Z 
* fBodyAccMag-mean 
* fBodyBodyAccJerkMag-mean 
* fBodyBodyGyroMag-mean 
* fBodyBodyGyroJerkMag-mean 
* tBodyAcc-std-X 
* tBodyAcc-std-Y
* tBodyAcc-std-Z
* tGravityAcc-std-X
* tGravityAcc-std-Y
* tGravityAcc-std-Z
* tBodyAccJerk-std-X
* tBodyAccJerk-std-Y
* tBodyAccJerk-std-Z 
* tBodyGyro-std-X 
* tBodyGyro-std-Y 
* tBodyGyro-std-Z 
* tBodyGyroJerk-std-X
* tBodyGyroJerk-std-Y
* tBodyGyroJerk-std-Z
* tBodyAccMag-std
* tGravityAccMag-std
* tBodyAccJerkMag-std
* tBodyGyroMag-std 
* tBodyGyroJerkMag-std
* fBodyAcc-std-X
* fBodyAcc-std-Y 
* fBodyAcc-std-Z 
* fBodyAccJerk-std-X 
* fBodyAccJerk-std-Y 
* fBodyAccJerk-std-Z 
* fBodyGyro-std-X 
* fBodyGyro-std-Y 
* fBodyGyro-std-Z 
* fBodyAccMag-std 
* fBodyBodyAccJerkMag-std 
* fBodyBodyGyroMag-std 
* fBodyBodyGyroJerkMag-std
