## This function fulfills 5 activities. This function downloads the data files if they are not on the R directory already.
## The data files are read and organised as data frames which are then merged into a single data frame.
## Formatting (i.e. labelling and selection of only mean and standard deviation for each measurement) is carried out on this data frame
## A second independent data set  with the average of each variable for each activity and each subject
## is created.

## Process
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

## Files are downloaded in this section.
if (!file.exists("UCI HAR Dataset")) 
{
  td = tempdir()
  tf = tempfile(tmpdir = td, fileext = ".zip")
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = tf, method = "curl")
  unzip(tf)
}

## Test and train data frames are generated in this section. The first column is the test subject and the last
## column is the test label. The features are stored in the columns in between.

if (!exists("tsubjectTestRaw"))
{
  tsubjectTestRaw <- read.table("UCI HAR Dataset/test/subject_test.txt",  stringsAsFactors=FALSE, header=FALSE)
  resultsTestRaw <- read.table("UCI HAR Dataset/test/X_test.txt",  stringsAsFactors=FALSE, header=FALSE)
  labelTestRaw <- read.table("UCI HAR Dataset/test/y_test.txt",  stringsAsFactors=FALSE, header=FALSE)
}

testRawDataFrame <- cbind(tsubjectTestRaw, resultsTestRaw, labelTestRaw)

if (!exists("tsubjectTrainRaw"))
{
  tsubjectTrainRaw <- read.table("UCI HAR Dataset/train/subject_train.txt",  stringsAsFactors=FALSE, header=FALSE)
  resultsTrainRaw <- read.table("UCI HAR Dataset/train/X_train.txt",  stringsAsFactors=FALSE, header=FALSE)
  labelTrainRaw <- read.table("UCI HAR Dataset/train/y_train.txt",  stringsAsFactors=FALSE, header=FALSE)
}

trainRawDataFrame <- cbind(tsubjectTrainRaw, resultsTrainRaw, labelTrainRaw)

## Both data frames are merged using rbind to form a single data frame.

mergedRawDataFrame <- rbind(testRawDataFrame, trainRawDataFrame)

## The measurements on the mean and standard deviation for each measurement are abstracted
## and stored into a new data frame which includes the test subject and the test label in numeric
## format.

meanStdDeviationDataFrame <- mergedRawDataFrame[, c(1, 2:7, 42:47, 82:87, 122:127, 162:167, 202:203, 215:216, 228:229, 241:242, 254:255, 267:272, 346:351, 425:430, 504:505, 517:518, 530:531, 543:544, 563)]

## The test label is formatted from numeric format to string format using the information stored on
## activity_labels.txt file.

meanStdDeviationDataFrame$V1.2 <- as.character(meanStdDeviationDataFrame$V1.2)
meanStdDeviationDataFrame$V1.2[which(meanStdDeviationDataFrame$V1.2 == "1")] <- "WALKING"
meanStdDeviationDataFrame$V1.2[which(meanStdDeviationDataFrame$V1.2 == "2")] <- "WALKING_UPSTAIRS"
meanStdDeviationDataFrame$V1.2[which(meanStdDeviationDataFrame$V1.2 == "3")] <- "WALKING_DOWNSTAIRS"
meanStdDeviationDataFrame$V1.2[which(meanStdDeviationDataFrame$V1.2 == "4")] <- "SITTING"
meanStdDeviationDataFrame$V1.2[which(meanStdDeviationDataFrame$V1.2 == "5")] <- "STANDING"
meanStdDeviationDataFrame$V1.2[which(meanStdDeviationDataFrame$V1.2 == "6")] <- "LAYING"

## Descriptive column names are added to the data frame using the information stored on the features.txt
## file.

names(meanStdDeviationDataFrame) <- c("Testsubject", "MeanbodyaccelerationXaxis", "MeanbodyaccelerationYaxis",  "MeanbodyaccelerationZaxis", "Std.devbodyaccelerationXaxis", "Std.devbodyaccelerationYaxis", "Std.devbodyaccelerationZaxis",  "MeangravityaccelerationXaxis", "MeangravityaccelerationYaxis",  "MeangravityaccelerationZaxis", "Std.devgravityaccelerationXaxis", "Std.devgravityaccelerationYaxis", "Std.devgravityaccelerationZaxis", "MeanbodyaccelerationjerkXaxis", "MeanbodyaccelerationjerkYaxis",  "MeanbodyaccelerationjerkZaxis", "Std.devbodyaccelerationjerkXaxis", "Std.devbodyaccelerationjerkYaxis", "Std.devbodyaccelerationjerkZaxis", "MeanbodyrotationalaccelerationXaxis", "MeanbodyrotationalaccelerationYaxis", "MeanbodyrotationalaccelerationZ axis", "Std.devbodyrotationalaccelerationXaxis", "Std.devbodyrotationalaccelerationYaxis", "Std.devbodyrotationalaccelerationZaxis", "MeanbodyrotationalaccelerationjerkXaxis", "MeanbodyrotationalaccelerationjerkYaxis", "MeanbodyrotationalaccelerationjerkZaxis", "Std.devbodyrotationalaccelerationjerkXaxis", "Std.devbodyrotationalaccelerationjerkYaxis", "Std.devbodyrotationalaccelerationjerkZaxis", "Meanbodyaccelerationmagnitude", "Std.devbodyaccelerationmagnitude", "Meangravityaccelerationmagnitude", "Std.devgravityaccelerationmagnitude", "Meanbodyaccelerationjerkmagnitude", "Std.devbodyaccelerationjerkmagnitude", "Meanbodyrotationalaccelerationmagnitude", "Std.devbodyrotationalaccelerationmagnitude", "Meanbodyrotationalaccelerationjerkmagnitude", "Std.devbodyrotationalaccelerationjerkmagnitude", "MeanbodyaccelerationfrequencyXaxis", "MeanbodyaccelerationfrequencyYaxis", "MeanbodyaccelerationfrequencyZaxis", "Std.devbodyaccelerationfrequencyXaxis", "Std.devbodyaccelerationfrequencyYaxis", "Std.devbodyaccelerationfrequencyZaxis", "MeanbodyaccelerationjerkfrequencyXaxis", "MeanbodyaccelerationjerkfrequencyYaxis", "MeanbodyaccelerationjerkfrequencyZaxis", "Std.devbodyaccelerationjerkfrequencyXaxis", "Std.devbodyaccelerationjerkfrequencyYaxis", "Std.devbodyaccelerationjerkfrequencyZaxis", "MeanbodyrotationalaccelerationfrequencyXaxis", "MeanbodyrotationalaccelerationfrequencyYaxis", "MeanbodyrotationalaccelerationfrequencyZaxis", "Std.devbodyrotationalaccelerationfrequencyXaxis", "Std.devbodyrotationalaccelerationfrequencyYaxis", "Std.devbodyrotationalaccelerationfrequencyZaxis", "Meanbodyaccelerationfrequencymagnitude", "Std.devbodyaccelerationfrequencymagnitude", "Meanbodyaccelerationjerkfrequencymagnitude", "Std.devbodyaccelerationjerkfrequencymagnitude", "Meanbodyrotationalaccelerationfrequencymagnitude", "Std.devbodyrotationalaccelerationfrequencymagnitude", "Meanbodyrotationalaccelerationjerkfrequencymagnitude", "Std.devbodyrotationalaccelerationjerkfrequencymagnitude", "Activity")

## Second independent data set with the average of each variable for each activity and each subject
## is created.

meanStdDeviationDataFrame_df <- tbl_df(meanStdDeviationDataFrame)
groupedMeanStdDeviationDataFrame <- group_by(meanStdDeviationDataFrame_df, Testsubject, Activity)
summarisedMeanStdDeviationDataFrame <- summarise_each(groupedMeanStdDeviationDataFrame, funs(mean))

## The data table is stored to a text file in this section
write.table(summarisedMeanStdDeviationDataFrame, file = "tidy_data.txt", row.names = FALSE)
