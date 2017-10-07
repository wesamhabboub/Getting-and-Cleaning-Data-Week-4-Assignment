# Getting-and-Cleaning-Data-Week-4-Assignment
This repo is created for the assignment of week 4 of the course Getting and Cleaning Data Coursera course.

1- download and unzip the data file into R working directory.
2- download the R source code into R working directory.
3- execute R source code run_analysis.r to generate the tidy data file.

Data description
-----------------

The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. 
The variable in the data Y indicates activity type the subjects performed during recording.

Code explaination
-----------------

The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

New dataset
-----------
The new generated dataset contain variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

The code was written based on the instruction of this assignment to:

Read training and test dataset into R environment. 
Read variable names into R envrionment. 
Read subject index into R environment.
Merges the training and the test sets to create one data set. 
Use command rbind to combine training and test set
Uses descriptive activity names to name the activities in the data set 
Extracts only the measurements on the mean and standard deviation for each measurement. 
Use grep command to get column indexes for variable name contains "mean()" or "std()"
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
