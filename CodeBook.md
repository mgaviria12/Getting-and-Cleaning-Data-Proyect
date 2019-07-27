# Codebook Getting and Cleaning Data Proyect

This file explains the variables in the tidy data set. This data was created by:
1. Merging the test and train files.
2. Select only the mean and std variables
3. Summarising the data grouped by activity and subject, using the mean()


activity
  Activity being realized by subject
  Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying
  
subject
  Number that identifies subject

Columns 3 - 68
  Mean of the measurements (mean and std) recorded by the Samsung phone in the X, Y and Z vectors.
 
  tBodyAcc-XYZ
  tGravityAcc-XYZ
  tBodyAccJerk-XYZ
  tBodyGyro-XYZ
  tBodyGyroJerk-XYZ
  tBodyAccMag
  tGravityAccMag
  tBodyAccJerkMag
  tBodyGyroMag
  tBodyGyroJerkMag
  fBodyAcc-XYZ
  fBodyAccJerk-XYZ
  fBodyGyro-XYZ
  fBodyAccMag
  fBodyAccJerkMag
  fBodyGyroMag
  fBodyGyroJerkMag
