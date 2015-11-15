# Getdata project script

# Step 1: reading and merging tha data sets

testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
testsubj <- read.table("UCI HAR Dataset/test/subject_test.txt")
testact <- read.table("UCI HAR Dataset/test/y_test.txt")
traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
trainsubj <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainact <- read.table("UCI HAR Dataset/train/y_train.txt")

data <- rbind(testdata, traindata)
subj <- rbind(testsubj, trainsubj)
act <- rbind(testact, trainact)
rm(testdata, testsubj, testact, traindata, trainsubj, trainact)

#Step 2: extracting measurements on mean and standard deviation

features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
names(data) <- features$V2
data <- data[grepl("-mean\\(",features$V2)|grepl("-std\\(",features$V2)]

#Step 3/4: using descriptive activity names and appropiate labels

actlab <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
names(subj) <- "Subject"
names(act) <- "Activity"
act$Activity <- actlab$V2[act$Activity]
data <- cbind(data, subj, act)

#Step 5: averages for each subject and activity

library(reshape2)
datamelt <- melt(data, id=c("Subject", "Activity"))
tidydata <- dcast(datamelt, Subject+Activity ~ variable, mean)
write.table(tidydata, file="tidydata.txt", row.names = FALSE)


