---
title: "CodeBook.md"
author: "A.Iordanova"
date: "08/18/2015"
output: pdf_document
---
This code book describes the data in the file tidy_data.txt

# Variable description
  The variables represent the average (mean) of the data summarized
  for each subject and activity.

## Factor variables

###subjects:
  * 30 subjects, representing number of people in the original study. 
  * subjects values are integers from 1 to 30

###activities:
  * 6 activities
  * different words in one activity are combined with a "."

Activity table:

| activity         |
|------------------|
|walking           |
|walking.upstairs  |
|walking.downstairs|  
|sitting           |
|standing          | 
|laying            |


## Measurement variables
  * The 66 variables in this tidy data represent only mean or standard deviation of specific phone measurements taken for a given subject and activity.    
  * These were extracted from the row data and had -mean() and -std() ending in the name.
  * All variables are derived using the linear accelaration sensor and the gyroscope sensor in the phone, in 3 different directions (x,y,z). The names are abreviated to prevent very long column names and all words are added together. 
  * Abreviations of the variable names:
    * t - Time signal variables, captured at a constant rate
    * f - Frequency signal variables, filtered in a time window
    * BodyAcc - body linear acceleration, filtered from the accelerometer sensor
    * GravityAcc - gravity acceleration, filtered from the accelerometer sensor 
    * BodyAccJerk - jerk signals, time derivative of BodyAcc
    * BodyGyr - body angular velocity, from the gyroscope sensor
    * BodyGyrJerk -jerk signal, time derivative of BodyGyr
    * Mag - magnitude of the signal
    * Mean or Std - the quantity is mean or standard deviation
    * X,Y,Z - 3-axial x,y,z directions of the measurement

List of measurement variables:

| number| time variable name |number |  frequency variable name      |
|-------|--------------------|-------|-------------------|
|1      | tBodyAccMeanX      |41     | fBodyAccMeanX     |
|2      | tBodyAccMeanY      |42     | fBodyAccMeanY     |
|3      | tBodyAccMeanZ      |43     | fBodyAccMeanZ     |        
|4      | tBodyAccStdX       |44     | fBodyAccStdX      |
|5      | tBodyAccStdY       |45     | fBodyAccStdY      |
|6      | tBodyAccStdZ       |46     | fBodyAccStdZ      |         
|7      | tGravityAccMeanX   |47     | fBodyAccJerkMeanX |
|8      | tGravityAccMeanY   |48     | fBodyAccJerkMeanY |
|9      | tGravityAccMeanZ   |49     | fBodyAccJerkMeanZ |     
|10     | tGravityAccStdX    |50     | fBodyAccJerkStdX  |
|11     | tGravityAccStdY    |51     | fBodyAccJerkStdY  |
|12     | tGravityAccStdZ    |52     |  fBodyAccJerkStdZ |      
|13     | tBodyAccJerkMeanX  |53     | fBodyGyroMeanX    |
|14     | tBodyAccJerkMeanY  |54     | fBodyGyroMeanY    |
|15     | tBodyAccJerkMeanZ  |55     | fBodyGyroMeanZ    |     
|16     | tBodyAccJerkStdX   |56     | fBodyGyroStdX     |
|17     | tBodyAccJerkStdY   |57     | fBodyGyroStdY     |
|18     | tBodyAccJerkStdZ   |58     | fBodyGyroStdZ     |
|19     | tBodyGyroMeanX     |59     | fBodyAccMagMean   |       
|20     | tBodyGyroMeanY     |60     | fBodyAccMagStd    |
|21     | tBodyGyroMeanZ     |61     | fBodyBodyAccJerkMagMean |      
|22     | tBodyGyroStdX      |62     | fBodyBodyAccJerkMagStd  |    
|23     | tBodyGyroStdY      |63     | fBodyBodyGyroMagMean    |
|24     | tBodyGyroStdZ      |64     | fBodyBodyGyroMagStd     |   
|25     | tBodyGyroJerkMeanX |65     | fBodyBodyGyroJerkMagMean|    
|26     | tBodyGyroJerkMeanY |66     | fBodyBodyGyroJerkMagStd |
|27     | tBodyGyroJerkMeanZ |       |                         |
|28     | tBodyGyroJerkStdX  |        |                         |
|29     | tBodyGyroJerkStdY  |        |                         |
|30     | tBodyGyroJerkStdZ  |        |                         |
|31     | tBodyAccMagMean    |        |                         |
|32     | tBodyAccMagStd     |        |                         |
|33     | tGravityAccMagMean |        |                         |
|34     | tGravityAccMagStd  |        |                         |
|35     | tBodyAccJerkMagMean|        |                         |
|36     | tBodyAccJerkMagStd |        |                         |
|37     | tBodyGyroMagMean   |        |                         |
|38     | tBodyGyroMagStd    |        |                         |
|39     | tBodyGyroJerkMagMean|        |                         |
|40     | tBodyGyroJerkMagStd |        |                       |        


# Data description
## The tidy data:
The tidy data is saved in a table with 68 variables and 180 columns.
The first two columns are the factor variables "subjects" and "activity". Columns 3 to 68 are the measurement variables averaged for the two factors.
    
## The initial data:
  * data source: 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  * Data is organized in train/ and test/ data sets directories:
  * train data with 561 variables and 7352 rows:
    * X_train.txt is the measurements' vector.
    * y_train.txt is the activity data, with 6 activity levels.
    * subject_train.txt is the subject variable, with 30 levels (people).    
  * test data with 61 variables and 2947 rows in each table:
    * X_test.txt is the measurements' vector.
    * y_test.txt is the activity data, with 6 activity levels.
    * subject_test.txt is the subject variable, with 30 levels (people).

# Transformations done to initial data
  The transformation of data is done in R/rstudio version version 3.2.1 (2015-06-18)
  on platform x86_64-pc-linux-gnu.
  The library dplyr Version: 0.4.2 is used.
  The rscript file is: run_analysis.R
  
  * Step 1: Reads train and test data. Bind rows of train/test data. Merges (bind columns of) train/test data in one table.
  * Step 2: Extracts only the columns
      on the mean and standard deviation for each measurement. 
  * Step 3: Use descriptive activity names to name the activities in the data set.
  * Step 4: Appropriately labels the data set with descriptive variable names.
  * Step 5: From the data set in step 4, creates a second, independent tidy data set. 
