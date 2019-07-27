## Getting and Cleaning Data Project

library(dplyr)

x_test <- read.table("/Users/MartinGaviria/Documents/R Documents/Getting and Cleaning Data Project/data/test/X_test.txt")
x_train <- read.table("/Users/MartinGaviria/Documents/R Documents/Getting and Cleaning Data Project/data/train/X_train.txt")
labels <- read.table("/Users/MartinGaviria/Documents/R Documents/Getting and Cleaning Data Project/data/features.txt", stringsAsFactors = FALSE)
labels <- labels[,2]
names(x_test) <- labels
names(x_train) <- labels

y_test <- read.table("/Users/MartinGaviria/Documents/R Documents/Getting and Cleaning Data Project/data/test/y_test.txt")
y_train <- read.table("/Users/MartinGaviria/Documents/R Documents/Getting and Cleaning Data Project/data/train/y_train.txt")

subject_test <- read.table("/Users/MartinGaviria/Documents/R Documents/Getting and Cleaning Data Project/data/test/subject_test.txt")
subject_train <- read.table("/Users/MartinGaviria/Documents/R Documents/Getting and Cleaning Data Project/data/train/subject_train.txt")


names(y_test) <- c("activity")
names(y_train)<- c("activity")
names(subject_test) <- c("subject")
names(subject_train)<- c("subject")

test <- cbind(y_test, subject_test, x_test)
train <- cbind(y_train, subject_train, x_train)

#1. Merges the training and the test sets to create one data set.
database <- rbind(test, train)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
labels2 <- names(database)
colsmean <- grep("mean\\(", labels2, value = FALSE)
colsstd <- grep("std", labels2, value = FALSE)
cols <- c(1, 2, colsmean, colsstd)
database2 <- database[,cols]

#3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("/Users/MartinGaviria/Documents/R Documents/Getting and Cleaning Data Project/data/activity_labels.txt")
database3 <- merge(activity_labels, database2, by.y = "activity", by.x = "V1")
database3 <- rename(database3, activity = V2, activity_number = V1)

#4. Appropriately labels the data set with descriptive variable names.

# Has already been done using the names in the features.txt file. See lines 7-10.

#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.

id_vect <- c("activity_number", "activity", "subject")
measure_vect <- names(database3)[-(1:3)]

datamelt <- melt(database3, id=id_vect, measure.vars = measure_vect )
meandata <- dcast(datamelt, activity + subject ~ variable, mean)
write.table(meandata, file = "Tidy Data Submission.txt", row.names = FALSE)

