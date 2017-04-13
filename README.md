# Getting-and-Cleaning-Data-Course-Project

Course Project

The R script called run_analysis.R  does the following:

    Creates a tempoary file location and downloads/unzips the UCI HAR Dataset.
    Merges the training and the test data create one data set.
    Mean and standard deviation for each measurement is then extracted.
    Renames the activities on the data set with descriptive names.
    Creates an independent tidy data set with the average of each variable for each activity and each subject.

Steps to work on this course project

    Download the data source and put into your working directory. You'll have a UCI HAR Dataset folder.
    Put run_analysis.R in the same working directory.
    Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in the same working directory.

