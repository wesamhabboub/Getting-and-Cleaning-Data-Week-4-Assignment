##Libraries load
library(plyr)
library(dplyr)
library(knitr)
library(memisc)

## Download the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Dataset.zip")

## Unzip The file
unzip(zipfile="./Dataset.zip")

##---1----- Merges the training and the test sets to create one data set 
##Read Training Sets
train_y<-read.table("./UCI HAR Dataset/train/y_train.txt")
train_x<-read.table("./UCI HAR Dataset/train/x_train.txt")
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")

## Read test sets
test_y<-read.table("./UCI HAR Dataset/test/y_test.txt")
test_x<-read.table("./UCI HAR Dataset/test/x_test.txt")
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")

##Read Features
act_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

##Merge Test and training sets
merged_y<-rbind(train_y,test_y)
merged_x<-rbind(train_x,test_x)
merged_subject<-rbind(train_subject,test_subject)

##Rename Columns
##Rename Subject V1 to Subject of Subject Data set
merged_subject<-rename(merged_subject,c("V1"="Subject"))
##Rename Activity V1 to Activity of Y Data set
merged_y<-rename(merged_y,c("V1"="Activity"))
##Rename act_labels column names
colnames(act_labels)<-c("ActivityID","ActivityName")

##Replace column name of dataset x by name of the variables from Features Dataset
##**
##**Question 4 - done here **
colnames(merged_x)<-features$V2

##Merge columns subject, y activity code and x variables
full_ds<-cbind(merged_subject,merged_y,merged_x)

##---------------------------------------------------------------------------------------------------
##---2----- Extracts only the measurements on the mean and standard deviation for each measurement
colfilter<-c(1,2,grep("mean",colnames(full_ds)), grep("std",colnames(full_ds)))
std_mean_ds<-full_ds[,colfilter]
##---------------------------------------------------------------------------------------------------
##---3----- Uses descriptive activity names to name the activities in the data set
std_mean_ds<-merge(std_mean_ds,act_labels,by.x ="Activity",by.y = "ActivityID" )

##---------------------------------------------------------------------------------------------------
##---4---- Appropriately labels the data set with descriptive variable names
##-------- Done in Question 1 check (**)
std_mean_ds<-std_mean_ds[,2:82]

##---------------------------------------------------------------------------------------------------
##---5---- From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject
tiddyData<-aggregate(.~Subject+ActivityName,std_mean_ds,mean)
write.table(tiddyData, file = "tidydata.txt",row.name=FALSE)

