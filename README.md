# Getting-and-Cleaning-Data-Project
## Course Project

The data used in the project was collected from the accelerometers from the Samsung Galaxy S smartphone. The source of the data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Steps of the project:

* After uploading the data, the folder called "UCI HAR Dataset" should be used as a working directory for the project.  
* Put "run_analysis.R" in the folder "UCI HAR Dataset" in order to run the code.
* Run "run_analysis.R". As a result, a new "TidyData.txt" file should be generated in the working directory.


### "run_analysis.R", its purpose and details of each step the code  
      
      Each part of the code performes the following:
* 1st PART. Merges the training and the test sets to create one data set. In particular, it reads all the test and training files and then combines it into one common data frame. 
    
* 2nd PART. Extracts only the measurements on the mean and standard deviation for each measurement.

* 3rd PART. Uses descriptive activity names to name the activities in the data set. In particular, it  replaces the numbers with the text from "activity_labels.txt".

* 4th PART. Appropriately labels the data set with descriptive variable names. 

* 5th PART. Based on the data set in part 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
