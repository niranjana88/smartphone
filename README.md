## Getting and Cleaning Data Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### This repo contains the following files:
1. `README.md` This file :)
2. `CodeBook.md` 
  1. Describes the variables
  2. Describes the data
  3. Describes the transformations performed to clean up the data
3. `run_analysis.R` Performs the transformation of the data and outputs into two data files
  1. `tidy.txt` Merged data from training and test data files
  2. `tidy_average.txt` Averages from `tidy.txt`

### Additional files not included in this repo:

1. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.