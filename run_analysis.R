# Getting and Cleaning Data - Final Project

# downloads and unzips data
if(!file.exists("UCI HAR Dataset")) {
  tmp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", tmp)
  unzip(tmp)
  unlink(tmp)
}

# reads in a description of the variables in the feature vector
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = F)[,2]
mean.i <- which(grepl("mean\\(\\)", features)) # positions of means in feature vector
std.i <- which(grepl("std", features)) # positions of standard deviations in feature vector

# reads in desired feature vector data for each measurement
feature.data <- read.table("UCI HAR Dataset/test/X_test.txt")[,c(mean.i, std.i)]
feature.data <- rbind(feature.data, read.table("UCI HAR Dataset/train/X_train.txt")[,c(mean.i, std.i)])
feature.names <- c("accelerometer-x","accelerometer-y","accelerometer-z",
                   "gravity-x","gravity-y","gravity-z",
                   "jerk-x","jerk-y","jerk-z",
                   "gyroscope-x","gyroscope-y","gyroscope-z",
                   "gyroscopejerk-x","gyroscopejerk-y","gyroscopejerk-z",
                   "accelerometermagnitude", "gravitymagnitude", "jerkmagnitude",
                   "gyroscopemagnitude","gyroscopejerkmagnitude",
                   "accelerometerfrequency-x","accelerometerfrequency-y","accelerometerfrequency-z",
                   "jerkfrequency-x","jerkfrequency-y","jerkfrequency-z",
                   "gyroscopefrequency-x","gyroscopefrequency-y","gyroscopefrequency-z",
                   "accelerometermagnitudefrequency","jerkmagnitudefrequency","gyroscopemagnitudefrequency",
                   "gyroscopejerkmagnitudefrequency")
feature.names <- c(paste(feature.names, "-mean", sep=""), paste(feature.names, "-std", sep=""))
names(feature.data) <- feature.names

# reads in activity data
activities <- c("walking", "walkingupstairs", "walkingdownstairs", "sitting", "standing", "laying")
activity.data <- read.table("UCI HAR Dataset/test/y_test.txt")
activity.data <- rbind(activity.data, read.table("UCI HAR Dataset/train/y_train.txt"))
activity.data[,1] <- factor(activity.data[,1], labels = activities)
names(activity.data) <- "activity"

# reads in subject data
subject.data <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject.data <- rbind(subject.data, read.table("UCI HAR Dataset/train/subject_train.txt"))
subject.data[,1] <- factor(subject.data[,1])
names(subject.data) <- "subject"

# merge all data together into one data frame
all.data <- cbind(feature.data, activity.data, subject.data)

# create a secondary dataframe of variable means by subject and activity
make.mean.vector <- function(vec) {
  output <- tapply(vec, interaction(all.data$subject, all.data$activity), mean)
  names(output) <- c()
  output
}
all.means <- lapply(1:ncol(feature.data), function(i) make.mean.vector(all.data[,i]))
all.means <- as.data.frame(all.means)
names(all.means) <- feature.names

# include subject and activity columns
all.means <- cbind(factor(rep(1:30, 6)), all.means)
all.means <- cbind(unlist(lapply(activities, function(a) rep(a,30))), all.means)
names(all.means)[1:2] <- c("subject", "activity")

# writes out the data frame of variable averages
write.table(all.means, file = "meansBySubjectAndActivity.txt", row.names = F)