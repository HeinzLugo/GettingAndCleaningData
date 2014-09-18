# Code book

## Important information to download and view the resulting data set

The tidy data set must be downloaded and imported into Excel using the Space delimiter. If the provided hyperlink is clicked directly the data set will open as a web page which does not look tidy at all. To download the file right click on it and use the Save Linked File As option. If you try to open the downloaded file using text edit or notepad the data set will not look tidy as the Space delimiter is not used during the formatting of the text file.

## Test information

The details of the tests carried out and the raw data are described in the README.txt, features.txt, features_info.txt provided in the downloaded file. In this code book I will only detail the processing done on the raw data.

## Process information

Once the raw data has been downloaded from the provided URL a set of 6 dataframes are created. Each dataframe represents the test subject, the features information and the activity label respectively. This is done for both the test and train raw data.

The dataframes and raw files loaded are the following:

1. For the test datasets

  * "UCI HAR Dataset/test/subject_test.txt" stored in the tsubjectTestRaw variable.
  * "UCI HAR Dataset/test/X_test.txt" stored in the resultsTestRaw variable.
  * "UCI HAR Dataset/test/y_test.txt" stored in the labelTestRaw variable.
  
2. For the train datasets

  * "UCI HAR Dataset/train/subject_train.txt" stored in the tsubjectTrainRaw variable.
  * "UCI HAR Dataset/train/X_train.txt" stored in the resultsTrainRaw variable.
  * "UCI HAR Dataset/train/y_train.txt" stored in the labelTrainRaw variable.

### First data transformation: Column binding and row binding

In order to create a single dataframe for the test data and the train data respectively the three datasets (e.g. tsubjectTrainRaw, resultsTrainRaw, labelTrainRaw) are column binded to the testRawDataFrame and the trainRawDataFrame for the test data and the train data respectively.

A single dataframe containing the joint test and train information is generated after row binding the testRawDataFrame and the trainRawDataFrame dataframes. This dataframe is stored in the mergedRawDataFrame dataframe. Up to this point besides gathering the test and train raw data the columns have not been altered and the descriptions stored in the features.txt file are still valid.

### Second data transformation: Selection of mean and standard deviation relevant columns

As there was no clear information of which mean and standard deviation variables should be selected all variables with either mean() or std() notation (e.g. tBodyAcc-mean()-X, tBodyAcc-std()-X) are grouped with the test subject and activity variables into a single dataframe stored in the meanStdDeviationDataFrame variable.

### Third data transformation: Activity labelling from numeric values to activity labels

At this point the activity information is stored as integers between 1 to 6. The activity label corresponding to each number is described in the activity_labels.txt file. Before changing the numeric notation into its corresponding activity label the column is transformed from numeric to character. The next step uses a which() function to retrieve the indexes of the rows containing an specific numeric character (e.g. "1", "6") and using those indexes replaces the numeric character to its corresponding activity label (e.g. "WALKING", "LAYING").

### Fourth data transformation: Column labelling with descriptive labels

The names of the columns are changed to resemble the information stored in them. The labels are are retrieved from the features.txt file (e.g. Testsubject, MeanbodyaccelerationXaxis, MeanbodyaccelerationYaxis)

### Fifth data transformation: Use of dplyr library and grouping of the dataframe by Testsubject and Activity

Using the group_by() function the dataframe is grouped by the Testsubject and Activity variables, this grouped dataframe is stored in the groupedMeanStdDeviationDataFrame variable.

Using the summarise_each() function the mean for all the remaining columns is calculated, the data is presented by the all the possible groupings of the Testsubject and Activity variables. The resulting dataframe is stored in the summarisedMeanStdDeviationDataFrame variable.

### Sixth data transformation: Storage of the dataframe in a txt file

The summarisedMeanStdDeviationDataFrame dataframe is stored in the tidy_data.txt file using the write.table() function.

## Data columns in the summarised data frame

The following are the columns store in the summarised data frame:

1. Testsubject
2. MeanbodyaccelerationXaxis
3. MeanbodyaccelerationYaxis
4. MeanbodyaccelerationZaxis
5. Std.devbodyaccelerationXaxis
6. Std.devbodyaccelerationYaxis
7. Std.devbodyaccelerationZaxis
8. MeangravityaccelerationXaxis
9. MeangravityaccelerationYaxis
10. MeangravityaccelerationZaxis
11. Std.devgravityaccelerationXaxis
12. Std.devgravityaccelerationYaxis
13. Std.devgravityaccelerationZaxis
14. MeanbodyaccelerationjerkXaxis
15. MeanbodyaccelerationjerkYaxis
16. MeanbodyaccelerationjerkZaxis
17. Std.devbodyaccelerationjerkXaxis
18. Std.devbodyaccelerationjerkYaxis
19. Std.devbodyaccelerationjerkZaxis
20. MeanbodyrotationalaccelerationXaxis
21. MeanbodyrotationalaccelerationYaxis
22. MeanbodyrotationalaccelerationZ axis
23. Std.devbodyrotationalaccelerationXaxis
24. Std.devbodyrotationalaccelerationYaxis
25. Std.devbodyrotationalaccelerationZaxis
26. MeanbodyrotationalaccelerationjerkXaxis
27. MeanbodyrotationalaccelerationjerkYaxis
28. MeanbodyrotationalaccelerationjerkZaxis
29. Std.devbodyrotationalaccelerationjerkXaxis
30. Std.devbodyrotationalaccelerationjerkYaxis
31. Std.devbodyrotationalaccelerationjerkZaxis
32. Meanbodyaccelerationmagnitude
33. Std.devbodyaccelerationmagnitude
34. Meangravityaccelerationmagnitude
35. Std.devgravityaccelerationmagnitude
36. Meanbodyaccelerationjerkmagnitude
37. Std.devbodyaccelerationjerkmagnitude
38. Meanbodyrotationalaccelerationmagnitude
39. Std.devbodyrotationalaccelerationmagnitude
40. Meanbodyrotationalaccelerationjerkmagnitude
41. Std.devbodyrotationalaccelerationjerkmagnitude
42. MeanbodyaccelerationfrequencyXaxis
43. MeanbodyaccelerationfrequencyYaxis
44. MeanbodyaccelerationfrequencyZaxis
45. Std.devbodyaccelerationfrequencyXaxis
46. Std.devbodyaccelerationfrequencyYaxis
47. Std.devbodyaccelerationfrequencyZaxis
48. MeanbodyaccelerationjerkfrequencyXaxis
49. MeanbodyaccelerationjerkfrequencyYaxis
50. MeanbodyaccelerationjerkfrequencyZaxis
51. Std.devbodyaccelerationjerkfrequencyXaxis
52. Std.devbodyaccelerationjerkfrequencyYaxis
53. Std.devbodyaccelerationjerkfrequencyZaxis
54. MeanbodyrotationalaccelerationfrequencyXaxis
55. MeanbodyrotationalaccelerationfrequencyYaxis
56. MeanbodyrotationalaccelerationfrequencyZaxis
57. Std.devbodyrotationalaccelerationfrequencyXaxis
58. Std.devbodyrotationalaccelerationfrequencyYaxis
59. Std.devbodyrotationalaccelerationfrequencyZaxis
60. Meanbodyaccelerationfrequencymagnitude
61. Std.devbodyaccelerationfrequencymagnitude
62. Meanbodyaccelerationjerkfrequencymagnitude
63. Std.devbodyaccelerationjerkfrequencymagnitude
64. Meanbodyrotationalaccelerationfrequencymagnitude
65. Std.devbodyrotationalaccelerationfrequencymagnitude
66. Meanbodyrotationalaccelerationjerkfrequencymagnitude
67. Std.devbodyrotationalaccelerationjerkfrequencymagnitude
68. Activity
