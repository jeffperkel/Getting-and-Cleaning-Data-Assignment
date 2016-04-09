This codebook contians a general decripion of the data and its variables as well as a walkthrough of the r script that ultimately outputs the tidy dataset as described in README.md <br><br>

<b>General description of data:</b> <br><br>

Link to the dataset and additional information is found in README.md

<i>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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
</i>

Contained within the final tidy dataset are the mean and std values for the above mentioned variables.
<hr>

<b>Specific files from the dataset used in this project:</b> <i>

1. features.txt': List of all features.

2. activity_labels.txt': Links the class labels with their activity name.

3. train/X_train.txt': Training set.

4. train/y_train.txt': Training labels.

5. test/X_test.txt': Test set.

6. test/y_test.txt': Test labels.

7. train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

8. test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
</i>
<hr>

<b>Actions taken by run_analysis.r:</b><i>

1. Checks for, downloads, and unzips dataset
2. Reads in above mentioned text files
3. Adds names to columns for easier readability
4. Applys labels to variables & activities
5. Selects only mean value and STD value variables
6. Merges subject ids, activities, and test/train data sets respectively to create independent test/train data sets
7. Merges test and train data sets into one master data set
8. Cleans variable labels of master data set for easier readability
9. Using reshape2 package, transforms master data into data set containing mean of each variable grouped by subject ID and activity
10. Saves out new data set from step 9 as tidy.txt


