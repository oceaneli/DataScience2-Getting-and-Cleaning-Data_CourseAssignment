# 1. Merges the training and the test sets to create one data set.
  # Read data in the features.txt, X_test.txt and X_test.txt 
wd = getwd()
features <- read.table(paste(wd, "/UCI HAR Dataset/features.txt", sep = ""))
X_test <- read.table(paste(wd, "/UCI HAR Dataset/test/X_test.txt", sep = ""), col.names=features[,2])
X_train <- read.table(paste(wd, "/UCI HAR Dataset/train/X_train.txt", sep = ""), col.names=features[,2])
  # Combine the two data sets to one by matching data according to the same feasure
X <- rbind(X_test, X_train) 

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
importantMeasures <- features[grep("(mean|std)\\(", features[,2]),]
mean_and_std <- X[,importantMeasures[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
y_test <- read.table(paste(wd, "/UCI HAR Dataset/test/y_test.txt", sep = ""), col.names = c('activity'))
y_train <- read.table(paste(wd, "/UCI HAR Dataset/train/y_train.txt", sep = ""), col.names = c('activity'))
  #Combine these 2 data frames by rows
y <- rbind(y_test, y_train)
labels <- read.table(paste(wd, "/UCI HAR Dataset/activity_labels.txt", sep = ""))
  #Name each activity in the date set
for (i in 1:nrow(labels)) {
        code <- as.numeric(labels[i, 1])
        name <- as.character(labels[i, 2])
        y[y$activity == code, ] <- name
}

# 4. Appropriately labels the data set with descriptive activity names.
X_combine_with_labels <- cbind(y, X)
mean_and_std_combine_with_labels <- cbind(y, mean_and_std)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subject_test <- read.table(paste(wd, "/UCI HAR Dataset/test/subject_test.txt", sep = ""), col.names = c('subject'))
subject_train <- read.table(paste(wd, "/UCI HAR Dataset/train/subject_train.txt", sep = ""), col.names = c('subject'))
subject <- rbind(subject_test, subject_train)
averages <- aggregate(X, by = list(activity = y[,1], subject = subject[,1]), mean)
write.table(averages, file=paste(wd, "/UCI HAR Dataset/result.txt", sep = ""), row.names=FALSE)
