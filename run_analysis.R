library(plyr)
# 1. -- Merge the training and the test sets to create one data set.

# Read in the data, label set, and subject codes for the test data
xtest    <- read.table("./UCI HAR Dataset/test/x_test.txt")         # data
ytest    <- read.table("./UCI HAR Dataset/test/y_test.txt")         # labels
testsubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")   # subjects


# Read in the data,label set, and subject codes for the train data
xtrain    <- read.table("./UCI HAR Dataset/train/x_train.txt")       # data
ytrain    <- read.table("./UCI HAR Dataset/train/y_train.txt")       # labels
trainsubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt") # subjects


# merge the two raw data tables together, row-wise.
Xdata <- rbind(xtest,xtrain)

# merge the two label sets; the labels correspond to activities; these are coded, as integers
Labels    <- rbind(ytest,ytrain)

# merge the two subject codes lists
Subjects <- rbind(testsubjects,trainsubjects)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table('./UCI HAR Dataset/features.txt')
neededFeatures <- features[grep("(mean|std)\\(", features[,2]),]
sortdata <- Xdata[ ,neededFeatures[,1]]

#3 Uses descriptive activity names to name the activities in the data set
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
Labels[, 1] <- activities[Labels[, 1], 2]

#4 Appropriately labels the data set with descriptive variable names


names(sortdata) <- neededFeatures$V2
names(Subjects) <- 'subject'
names(Labels) <- 'activity'
df <- cbind(Subjects, Labels, sortdata)

#5 From the data set in step 4, creates a second, independent 
#tidy data set with the average of each variable for each activity and each subject.
# 66 <- 68 columns but first two (activity & subject)
tidy_data <- ddply(df, .(subject, activity), function(x) colMeans(x[, 3:68]))
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)


     


