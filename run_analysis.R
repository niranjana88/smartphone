##########################
#  David Lyons
#  Coursera, Finding and Cleaning Data course project
#
#  This script takes the data from the Human Activity Recognition Using 
#  Smartphones study and transforms these data for further analysis. 

library(RCurl)
library(dplyr)

#  Check to see if the data is already in the working directory. If it is not,
#  then download the data and unzip it
if (!file.exists('UCI HAR Dataset')) {
        phonedata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        print("Downloading data set.")
        download.file(phonedata, 'phonedata.zip', method='curl', quiet = TRUE)
        print("Unzipping Dataset.")
        unzip('phonedata.zip')
        # Delete the downloaded file now that it is unzip and no londer needed
        unlink('phonedata.zip') 
}

# Read and store the data files
x_test <- read.table('UCI HAR Dataset//test//X_test.txt')
y_test <- read.table('UCI HAR Dataset//test//y_test.txt')
subject_test <- read.table('UCI HAR Dataset//test//subject_test.txt')

x_train <- read.table('UCI HAR Dataset//train//X_train.txt')
y_train <- read.table('UCI HAR Dataset//train//y_train.txt')
subject_train <- read.table('UCI HAR Dataset//train//subject_train.txt')

features <- read.table('UCI HAR Dataset//features.txt', stringsAsFactors = FALSE)

#  Merge the training and the test sets to create one data set.
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

#  Extract only the measurements on the mean and standard deviation 
#     for each measurement.

#  Use descriptive activity names to name the activities in the data set

#  Labels the data set with descriptive variable names

#  Create a second, independent tidy data set with the average of each variable
#  for each activity and each subject.
