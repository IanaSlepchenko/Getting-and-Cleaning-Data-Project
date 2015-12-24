##  1st PART.
##  The code below will describe how to read and merge 
##  the training and the test sets in order to create one common data set.

## Set a working directory:
setwd("C:/Users/Jani/Desktop/R-programming/Rdocuments/Getting&Cleaning_Project/UCI HAR Dataset")

## For Test data set:
data_test <- read.table("test/X_test.txt")
label_test <- read.table("test/y_test.txt", col.names="label")
subject_test <- read.table("test/subject_test.txt", col.names="subject")

## For Training data set:

data_train <- read.table("train/X_train.txt")
label_train <- read.table("train/y_train.txt", col.names="label")
subject_train <- read.table("train/subject_train.txt", col.names="subject")

## Merging two data sets (Test and Train) in one common data set

all_data <- rbind(cbind(subject_test, label_test, data_test),
                  cbind(subject_train, label_train, data_train))


## 2nd PART 
## The following part of the code will be aimed to extract only 
## the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
mean_deviation_features<- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
mean_and_deviation <- all_data[, c(1, 2, mean_deviation_features$V1+2)]


## 3rd PART
## This part of the code will use descriptive activity names in order
## to name the activities in the data set

activity_labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
mean_and_deviation$label <- activity_labels[mean_and_deviation$label, 2]


## 4th PART
## This part of the code will be aimed to label the data set with 
## descriptive variable names.
column_names <- c("subject", "label", mean_deviation_features$V2)
colnames(mean_and_deviation) <- column_names

## 5th PART
## This part of code will be aimed to create a second, independent tidy data set
## (based on part 4) with the average of each variable for each activity and 
## each subject.

data <- aggregate(mean_and_deviation[, 3:ncol(mean_and_deviation)],
                  by=list(subject = mean_and_deviation$subject, 
                          label = mean_and_deviation$label),
                  mean)


## Final PART - creating of txt-document in order to save a tidy data

write.table(format(data, scientific=TRUE), "TidyData.txt",
            row.names=FALSE, col.names=FALSE, quote=2)
