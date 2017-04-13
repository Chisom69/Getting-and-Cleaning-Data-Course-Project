# Read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
# Read data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Read testing tables:
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# Read trainings tables:
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Assign column name
colnames(activity_labels) <- c('Activity_ID','Activity_Label')

# Assign column name
colnames(y_test) = c("Activity_ID")
colnames(subject_test) = "subject_ID"
colnames(x_test) <- features 
# combine all test data
test_data <- cbind(subject_test, y_test, x_test)

# Assign column name
colnames(y_train) = c("Activity_ID")
colnames(subject_train) = "subject_ID"
colnames(x_train) <- features
# combine all train data
train_data <- cbind(subject_train, y_train, x_train)

# Merge test and train data:
combined_data = rbind(test_data, train_data)

#remove files after loading data and processing data:
rm(list = ls()[grep("test|train", ls())])
rm(list = ls()[grep("^temp", ls())])

#Reading column namesfrom combined_data:
columnNames <- colnames(combined_data)

#Making nessesary subset from combined_data:
mean_and_std <- grepl("Activity_ID|subject_ID|mean..|mean..", columnNames)  

#Making nessesary subset from combined_data:
mean_std_data<-combined_data[, mean_and_std == TRUE]

# Using descriptive activity names to name the activities in the data set:
Activity_Name_data <- merge(mean_std_data, activity_labels, by.x ="Activity_ID", 
                            all.x=TRUE)

#Clear all vriables except last data set:
rm(list=(ls()[ls()!="Activity_Name_data"]))

tidy_data<-aggregate(. ~ subject_ID + Activity_ID, Activity_Name_data, mean)
write.table(tidy_data, file = "./tidy_data.txt", row.names = FALSE)