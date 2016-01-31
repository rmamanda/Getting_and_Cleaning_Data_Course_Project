## Introduction

This repositry refers to final assignment on "Getting and Cleaning Data" Coursera course.
The purpose of this project is to demonstrate abilities to collect, work with, and clean a data set.

## Dataset

This assignment uses data from <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">UCI - Human Activity Recognition Using Smartphones Data Set </a> collected from the accelerometers from the Samsung Galaxy S smartphone. Full description <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">here</a>.

## Assignment

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set.
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files

run_Analysis.R - R script, executes all steps described on Assignment item.
tidy_data.txt - Output from R script, tidy data result from step 5.
CodeBook.md

## Execution

Download the dataset and unzip it on your Working Directory, folder UCI HAR Dataset folder.
Place file run_Analysis.R from this repository on your Working Directory.
On RStudio, setup your Working Directory (```setwd´´) and execute ```source("run_Analysis.R")´´´.
Script run_Analysis.R creates ```tidy_data.txt´´´, running all steps described on Assignment item.

## Dependencies
Script file installs and loads packages plyr and dplyr. 