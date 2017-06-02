# Introduction

This repository contains the files for submission for Coursera's Getting and Cleaning Data Course Project. The project requires downloading the dataset [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and creating an R script that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Repository Files
* This file, `README.md`, contains basic information about the project and how to run it.
* `run_analysis.R` is the script used for cleaning the data.
* `CodeBook.md` contains information about the variables in `run_analysis.R`.

# Running the Code
1. Download the files from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the folder inside the download.
3. Open RStudio.
4. Use `setwd()` to change the working directory to the unzipped folder from step 2.
5. Run `run_analysis.R` in RStudio.
