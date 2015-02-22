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
This is the data that the `run_analysis.R` script modifies:

1. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
<cite> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. "A Public Domain Dataset for Human Activity Recognition Using Smartphones." *21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning*, ESANN 2013. Bruges, Belgium 24-26 April 2013.</cite>

**Note:** *You do not have to download for the script to work. The above link is provided for reference. The script will download if the `UCI HAR Dataset` directory does not exist during execution.*


