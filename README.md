GettingCleaningData
===================
The script run_analysis.R loads data collected from the accelerometers from the Samsung Galaxy S smartphone (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The files need to be in the working directory when running the script. R packages plyr and dplyr are required.
The script merges the training and the test sets to create one data set, and extracts only the measurements on the mean and standard deviation for each measurement. 
The descriptive activity names and subjects, i.e. voluteer ID number are merged into the data frame, and descriptive variable names are gotten from features of the data. 
A tidy data set with the average of each variable for each activity and each subject is created and, finally, written to an output file called tidydata.txt.
