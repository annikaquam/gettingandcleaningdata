library(dplyr)
features <- read.table("UCI HAR Dataset/features.txt", col.names=c("n", "functions"))
activities <- read.table("UCI Har Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI Har Dataset/test/subject_test.txt", col.names="subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names="code")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names= features$functions)
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", col.names="code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)
merged_data <- cbind(subject_all, y_all, x_all)
full_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))
full_data$code <- activities[full_data$code, 2]
names(full_data)[2] = "activity"
names(full_data)<-gsub("Acc", "Accelerometer", names(full_data))
names(full_data)<-gsub("Gyro", "Gyroscope", names(full_data))
names(full_data)<-gsub("BodyBody", "Body", names(full_data))
names(full_data)<-gsub("Mag", "Magnitude", names(full_data))
names(full_data)<-gsub("^t", "Time", names(full_data))
names(full_data)<-gsub("^f", "Frequency", names(full_data))
names(full_data)<-gsub("tBody", "TimeBody", names(full_data))
names(full_data)<-gsub("-mean()", "Mean", names(full_data), ignore.case = TRUE)
names(full_data)<-gsub("-std()", "STD", names(full_data), ignore.case = TRUE)
names(full_data)<-gsub("-freq()", "Frequency", names(full_data), ignore.case = TRUE)
names(full_data)<-gsub("angle", "Angle", names(full_data))
names(full_data)<-gsub("gravity", "Gravity", names(full_data))

final_data <- full_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))
write.table(final_data, "final_data.txt", row.name=FALSE)

