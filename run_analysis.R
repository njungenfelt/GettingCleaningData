library(plyr)
library(dplyr)

#Load data
test <- read.table("test/X_test.txt")
testAct <- read.table("test/y_test.txt")
testSub <- read.table("test/subject_test.txt")
train <- read.table("train/X_train.txt")
trainAct <- read.table("train/y_train.txt")
trainSub <- read.table("train/subject_train.txt")
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

#Merge sets
fullSet <- rbind(test, train)

#Extract measurements
means <- grep("-mean()", features[,2], fixed=TRUE)
stdevs <- grep("-std()", features[,2], fixed=TRUE)
measures <- sort(c(means, stdevs))
relevantSet <- fullSet[,measures]

#Add activity names
actNamesTest <- join(testAct,activities)
actNamesTrain <- join(trainAct,activities)
actNames <- rbind(actNamesTest, actNamesTrain)[,2]
relevantSet <- cbind(actNames, relevantSet)

#Add subject column
subject <- rbind(testSub, trainSub)
relevantSet <- cbind(subject, relevantSet)

#Give descriptive column names
names(relevantSet) <- c("subject", "activityType", as.character(features[measures,2]))
relevantSet$subject <- factor(relevantSet$subject)

#Compute average by subject and activity
tidySet <- group_by(relevantSet, subject, activityType)
tidySet <- summarise_each(tidySet, funs(mean))

#Write to file
write.table(tidySet, file="tidydata.txt", row.names=FALSE)
