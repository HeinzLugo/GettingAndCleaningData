# Process summary

The provided script fulfills a set of 5 activites.

1. Merging of the test and train datasets into a single data set.
2. Extraction  of the mean and standard deviation variables for each measurement. 
3. Labelling of the activities on the data set with descriptive activity names (i.e. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
4. Labelling the data set columns with descriptive variable names (e.g. Testsubject, MeanbodyaccelerationXaxis, MeanbodyaccelerationYaxis).
5. Creation of an independent tidy data set summarizing the average for each variable stored in the data set from activity 4 but grouped by activity and test subject.

# Process details

The script checks if the files have been previously downloaded. If they have not been previously downloaded the script downloads them into a temporary directory and unzips the files in the R directory.

The script checks if the train and test datasets have been previously loaded as data frames in R. If the have not been previously downloaded the script reads the text files skipping any headers and preventing strings being converted into factors (i.e. stringsAsFactors=FALSE, header=FALSE in the read.table files). If the datasets have been previously loaded this step is skipped reducing the system time for the script.

The files downloaded are the following:

1. For the test datasets

  * "UCI HAR Dataset/test/subject_test.txt" stored in the tsubjectTestRaw variable.
  * "UCI HAR Dataset/test/X_test.txt" stored in the resultsTestRaw variable.
  * "UCI HAR Dataset/test/y_test.txt" stored in the labelTestRaw variable.
  
2. For the train datasets

  * "UCI HAR Dataset/train/subject_train.txt" stored in the tsubjectTrainRaw variable.
  * "UCI HAR Dataset/train/X_train.txt" stored in the resultsTrainRaw variable.
  * "UCI HAR Dataset/train/y_train.txt" stored in the labelTrainRaw variable.
  
The test and train datasets are column binded into the testRawDataFrame and trainRawDataFrame data frames. This individual dataframes are then row binded into the mergedRawDataFrame dataframe. At this point the dataframe contains the information from both the test and train datasets but also columns storing information other than the mean and standard deviation information for each measurement (e.g. tBodyAcc-energy()-X, tBodyAcc-iqr()-X) as described in the features.txt file.

As there was no clear information of which mean and standard deviation variables should be selected the script selects all variables with either mean() or std() notation (e.g. tBodyAcc-mean()-X, tBodyAcc-std()-X) and groups these variables with the test subject and activity variables into a single dataframe stored in the meanStdDeviationDataFrame variable.

At this point the activity information is stored as integers between 1 to 6. The activity label corresponding to each number is described in the activity_labels.txt file. Before changing the numeric notation into its corresponding activity label the column is transformed from numeric to character. The next step uses a which() function to retrieve the indexes of the rows containing an specific numeric character (e.g. "1", "6") and using those indexes replaces the numeric character to its corresponding activity label (e.g. "WALKING", "LAYING").

Up to this point the column names are not indicative of the information they store. To solve that the names of the columns are changed to more descriptive labels (e.g. Testsubject, MeanbodyaccelerationXaxis, MeanbodyaccelerationYaxis). The names are retrieved from the features.txt file.

A second dataframe is created using the tbl_df() function from the dplyr library to make the grouping activity easier. This new dataframe is stored in the meanStdDeviationDataFrame_df variable

Using the group_by() function the dataframe is grouped by the Testsubject and Activity variables, this grouped dataframe is stored in the groupedMeanStdDeviationDataFrame variable.

Using the summarise_each() function the mean for all the remaining columns is calculated, the data is presented by the all the possible groupings of the Testsubject and Activity variables. The resulting dataframe is stored in the summarisedMeanStdDeviationDataFrame variable.

Finally the summarisedMeanStdDeviationDataFrame dataframe is stored in the tidy_data.txt file using the write.table() function.



 