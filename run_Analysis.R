## Install package 
if (!require("plyr")) {
    install.packages("plyr")
}

if (!require("dplyr")) {
    install.packages("dplyr")
}

library(plyr)
library(dplyr)

## Set Wroking Directory
## setwd("D:/Coursera/Getting_and_Cleaning_Data_Final")

## Read features & labels
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, sep="")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep="")

## Read train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt" , header = FALSE, sep="")
x_train <- read.table("UCI HAR Dataset/train/x_train.txt", header = FALSE, sep="")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

## Read test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep=" ")
x_test <- read.table("UCI HAR Dataset/test/x_test.txt", header=FALSE, sep="")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

## Data check
str(subject_train)
class(subject_train)
str(x_train)
class(x_train)
str(y_train)
class(y_train)

str(subject_test)
class(subject_test)
str(x_test)
class(x_test)
str(y_test)
class(y_test)

## Rename features, subject and activity variables
colnames(activity_labels) <- c("id","name")
colnames(features) <- c("id","name")
colnames(subject_train) <- c("subject")
colnames(y_train) <- c("activity")
colnames(subject_test) <- c("subject")
colnames(y_test) <- c("activity")

## Merge the training and the test sets to create one data set
merge_train<-cbind(subject_train, y_train)
merge_train<-cbind(merge_train, x_train)

## Bind test data
merge_test<-cbind(subject_test, y_test)
merge_test<-cbind(merge_test, x_test)

## Bid train and test data
merge_all<-rbind(merge_train,merge_test, make.row.names = FALSE)

## Extracts only the measurements on the mean and standard deviation for each measurement
select_cols<-grep("mean()|std()",features$name)
data<-select(merge_all,subject, activity,num_range("V",select_cols))

## Uses descriptive activity names to name the activities in the data set
activity_labels<-arrange(activity_labels,id)
activity_lookup <- activity_labels$name
data <- mutate(data,activity=activity_lookup[activity])

## Appropriately label the data set with descriptive variable names
## Replace special chars
features$name<-gsub("-","\\.",features$name)
features$name<-gsub("\\,","\\.",features$name)
features$name<-gsub("\\(","",features$name)
features$name<-gsub("\\)","",features$name)
features$name<-gsub("^t","time",features$name)
features$name<-gsub("^f","frequency",features$name)
features$name<-tolower(features$name)

## Rename variables
featuresNames<-features$name[select_cols]
otherNames<-c("subject","activity")
variableNames<-append(otherNames,featuresNames)
colnames(data)<-variableNames

## From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data<-ddply(data, .(subject,activity), colwise(mean))

## Write tidy data to file
write.table(tidy_data, file="tidy_data.txt", row.name=FALSE ) 
