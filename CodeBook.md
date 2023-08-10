The UCI HAR Data needs to be downloaded into the R environment 

Creates variables from downloaded data text file
1. features <-features.txt
2. activities <- activity_labels.txt
3. subject_test <- test/subject_test.txt
4. x_test <- test/X_test.txt
5. y_test<- test/Y_test.txt
6. subject_train <- test/y_test.txt
7. x_train <- test/X_train.txt
8. y_train <_ test/Y_train.txt

Merges the data sets into one 
1. x_all is a combination of x_train and x_test using rbind()
2. y_all is a combination of y_train and y_test using rbind()
3. subject_all is a combination of subject_test and subject_train using rbind()
4. merged_data is a combination of x_all, y_all, and subject_all using cbin()

Extracts only the measurements on the mean and standard deviation for each measurement. 
-full_data subsets merged_data and selects the subject, code, and mean and sd for the measurements

Uses descriptive activity names to name the activities in the data set
-the numbers in the code column of full_data is replaced by the second column of the activities variable

Appropriately labels the data set with descriptive variable names. 
- code in full_data is replaced by activities
- acc is changed to accelerometer
- gyro is changed to gyroscope
- bodybody is changed to body
- mag is changed to magnitude
- all columns that start with f is changed to frequency
- all columns that start with t is changed to time
  
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- final_data is the summarized version of full_data that takes the means of each of the variables for each activity and each subject once it is grouped by 
subject and activity
- it is exported from final_data into a final_data.txt file  
