library(dplyr)

#my working directory. for other users, set this to where the UCI dataset is stored on your local machine.
setwd("C:/Users/v-scburg/Desktop/UCI HAR Dataset")



#1. Merges the training and the test sets to create one data set.
x_train <- read.table("train/X_train.txt",nrows=7353)
x_test <- read.table("test/X_test.txt",nrows=2948)
xmerge <- rbind(x_train,x_test)

y_train <- read.table("train/y_train.txt",nrows=7353)
y_test <- read.table("test/y_test.txt",nrows=2948)
ymerge <- rbind(y_train,y_test)


subject_train <- read.table("train/subject_train.txt",nrows=7353)
subject_test <- read.table("test/subject_test.txt",nrows=2948)
smerge <- rbind(subject_train,subject_test)



#2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
features_mean_std <- filter(features, grepl('mean|std', V2))

xkeep <- xmerge[,features_mean_std$V1]
colnames(xkeep) <- features_mean_std$V2







#3. Uses descriptive activity names to name the activities in the data set

colnames(smerge) <- c("subject")

activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels) <- c("activity_label","activity")

colnames(ymerge) <- c("activity_label")
ymerge_activity_join <- left_join(ymerge,activity_labels)

full_merge <- cbind(smerge,ymerge_activity_join,xkeep)

full_merge$activity_label <- NULL

#4. Appropriately labels the data set with descriptive variable names. 

###############done in step 3, see above.

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


groupmeans <- full_merge %>% group_by(subject,activity) %>% summarise_each(funs(mean))

write.table(groupmeans,file = "tidy.txt", row.names = FALSE)


