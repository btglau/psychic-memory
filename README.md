# Coursera / JHU Data Science / Getting and Cleaning Data
## Course Project: creating a tidy Samsung data set

This README file describes what occurs in run_analysis.R. In the .R file, each line is commented to explain what is happening.

For the script to work, place it in your working directory. In the same directory, please have the original dataset from the course assignment unzipped to a folder called "UCI HAR Dataset" (which is the default folder it should unzip to). The program creates a data file called "X_avg.txt" which is task 5 of the Course Project.

--> This code requires the data.table and dplyr packages

The program flow of the script is as follows:

1. It creates paths to the relevant files
2. It creates a full data set from the test/train data sets, while also attaching the subject number and whether they are from test or train
3. It selects only mean() and std() from the list of measurements
4. The data set is split according to subject #, and then activity type (1 of 6)
5. The mean() and std() measurements are averaged according to activity
6. The data set is recombined and then written to "X_avg.txt"
