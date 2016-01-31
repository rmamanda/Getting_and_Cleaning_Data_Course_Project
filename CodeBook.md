## CodeBook

This Code Book describes the variables, the data, and any transformations or work performed to clean up the data.

## Datasource 

Original data: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">UCI - Human Activity Recognition Using Smartphones Data Set </a>
Full description <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">here</a>.

## Data 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.  

For each record it is provided:  

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
- Triaxial Angular velocity from the gyroscope.  
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.  

The dataset includes the following files:  

- 'README.txt'  
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.  

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Work
- Download the dataset file and unzip it on your Working Directory.
- Install and load packages plyr and dplyr
- Load data from files into datasets using read.table(header = FALSE, sep=""):  
  *UCI HAR Dataset/features.txt into features  
  *UCI HAR Dataset/activity_labels.txt into activity_labels  
  *UCI HAR Dataset/train/subject_train.txt into subject_train  
  *UCI HAR Dataset/train/x_train.txt into x_train  
  *UCI HAR Dataset/train/y_train.txt into y_train  
  *UCI HAR Dataset/test/subject_test.txt into subject_test  
  *UCI HAR Dataset/test/x_test.txt into x_test  
  *UCI HAR Dataset/test/y_test.txt into y_test  
- Check all datasets with str, class	
- Rename the columns on datasets:  
  *features to "id", "name"  
  *activity_labels to "id", "name"  
  *subject_train to "subject"   
  *y_train to "activity"  
  *subject_test to "subject"  
  *y_test to "activity"  
- Merge dataset subject_train, y_train and x_train into merge_train dataset
- Merge dataset subject_test, y_test and x_test into merge_test dataset
- Merge dataset merge_train and merge_test into merge_all
- Find itens that contains mean() or std() on features dataset, 
- Select from the merge_all dataset that match the itens found on the previous taks, includind subject and activity info.
- On the new dataset replace the activity info, that is currently and id, by the activity label, usign activity_labels dataset.
- On the new dataset rename the variables considering the names on features dataset, considering the following:
-- Remove special characters "," "(" ")" ","
- Prefix with "time" all the features that starts with "t"
-- Prefix with "frequency" all the features that starts with "f"
-- Lower Case
- On the new dataset calculate the mean on all features column, grouping by subject and activity, store it in tidy_data dataset
- Write tidy_data on a text file


