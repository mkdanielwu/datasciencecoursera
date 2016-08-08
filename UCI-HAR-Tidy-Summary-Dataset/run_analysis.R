## 1. Initial set up
# set working directory - this should be changed to where this script is located
# the "UCI HAR Dataset" should be extracted in this directory as well

setwd("C:/Users/daniel/Documents/Courses/Data Science/03 Getting and Cleaning Data/course project")

library(dplyr)

## 2. Read activities and features names
# read raw activity label data
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                             col.names = c("activity.id", "activity.name"),
                             colClasses = c("factor", "character"))

# read raw feature label data, remove parentheses from feature name
features <- read.table("./UCI HAR Dataset/features.txt", 
                            col.names = c("feature.id", "feature.name"),
                            colClasses = c("factor", "character")) %>%
    mutate(feature.name = gsub("[()]", "", feature.name)) %>%
    select(feature.name)

## 3. Process training data set
# read raw training data
trainingSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                               col.names = c("subject"),
                               colClasses = "factor")

# read raw training features, keep only mean and std variables
trainingFeatures <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                               col.names = features$feature.name,
                               colClasses = "numeric") %>%
    select(matches("\\.(mean|std)(\\.|$)", ignore.case = TRUE))

# read raw training labels and join with the activity data to get activity names
trainingLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                             col.names = c("activity.id"),
                             colClasses = "factor")

trainingLabels <- merge(trainingLabels, activities, by.x="activity.id", by.y = "activity.id", all.x=TRUE)

# combine subject, activity, and all features into one DF
trainingDF <- cbind(trainingSubjects, activity = trainingLabels$activity.name, trainingFeatures)

print(paste("Training data set row count: ", nrow(trainingDF)))

## 4. Process test data set
# read raw test data
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                          col.names = c("subject"),
                          colClasses = "factor")

# read raw test features, keep only mean and std variables
testFeatures <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                           col.names = features$feature.name,
                           colClasses = "numeric") %>%
    select(matches("\\.(mean|std)(\\.|$)", ignore.case = TRUE))

# read raw test labels and join with the activity data to get activity names
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                           col.names = c("activity.id"),
                           colClasses = "factor")

testLabels <- merge(testLabels, activities, by.x="activity.id", by.y = "activity.id", all.x=TRUE)

# combine subject, activity, and all features into one DF
testDF <- cbind(testSubjects, activity = testLabels$activity.name, testFeatures)

print(paste("Test data set row count: ", nrow(testDF)))

## 5. Combine test and training data
combinedDF <- rbind(trainingDF, testDF)

print(paste("Combined tidy data set row count: ", nrow(combinedDF)))


## 6. Create summary data set based on combinedDF

summaryDF <- group_by(combinedDF, subject, activity) %>%
    summarize_each(funs(mean))

print(paste("Summary tidy data set row count: ", nrow(summaryDF)))


## 7. Save the combined DF and the summary DF to csv files
write.csv(combinedDF, file = "UCI-HAR-Tidy-Dataset.csv", row.names=FALSE, na="")
write.csv(summaryDF, file = "UCI-HAR-Summary-Dataset.csv", row.names=FALSE, na="")

