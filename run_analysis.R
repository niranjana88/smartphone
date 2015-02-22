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
        print("Downloading Dataset.")
        download.file(phonedata, 'phonedata.zip', method='curl', quiet = TRUE)
        print("Unzipping Dataset.")
        unzip('phonedata.zip')
        # Delete the downloaded file now that it is unzip and no londer needed
        unlink('phonedata.zip') 
}

print("Reading Dataset.")


# Read and store the data files
x_test <- read.table('UCI HAR Dataset//test//X_test.txt')
y_test <- read.table('UCI HAR Dataset//test//y_test.txt')
subject_test <- read.table('UCI HAR Dataset//test//subject_test.txt')

x_train <- read.table('UCI HAR Dataset//train//X_train.txt')
y_train <- read.table('UCI HAR Dataset//train//y_train.txt')
subject_train <- read.table('UCI HAR Dataset//train//subject_train.txt')

activities <- read.table("UCI HAR Dataset//activity_labels.txt")
features <- read.table('UCI HAR Dataset//features.txt', stringsAsFactors = FALSE)

print("Merging Dataset.")

#  Merge the training and the test sets to create one data set.
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

print("Removing temp variables from memory.")
# Clean up temp variables from memory
rm(x_train)
rm(y_train)
rm(subject_train)
rm(x_test)
rm(y_test)
rm(subject_test)

print("Cleaning Dataset")
# Clean up dataset with descriptive variable names
features <- features$V2
names(x) <- features
subject <- rename(subject, subject = V1)

#  Use descriptive activity names to name the activities in the data set
activities$V2 = gsub("_", "", tolower(as.character(activities$V2)))
y <- merge(y, activities, by.x = "V1", by.y = "V1")
y <- rename(y, activity = V2)
y$V1 <- NULL

#  Extract only the measurements on the mean and standard deviation 
#     
pick_columns <- grep("(std|mean[^F])", features)
x <- x[, pick_columns]

# Merge into one tidy dataset
tidy_data <- cbind(subject, y, x)

print("tidy_data.txt created.")

#  Create a second, independent tidy data set with the average of each variable
#  for each activity and each subject.
