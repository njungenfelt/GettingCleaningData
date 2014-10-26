##Code Book
###Loaded Data
The following information is loaded into R from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip:

| Variable      | File                   |
| ------------- |------------------------|
| `test`          | test/X_test.txt        |
| `testAct`       | test/y_test.txt        |
| `testSub`       | test/subject_test.txt  |
| `train`         | train/X_test.txt       |
| `trainAct`      | train/y_test.txt       |
| `trainSub`      | train/subject_train.txt|
| `features`      | features.txt           |
| `activities`    | activity_labels.txt    |

###Other Variables
Other important variables included in the data cleaning are derived as follows:

| Variable      | Description                   |
| ------------- |------------------------|
| `fullSet`       | Merge of `test` and `train`        |
| `means`       | Indices of `features` containing mean        |
| `stdevs`       | Indices of `features` containing standard deviation        |
| `measures`       | Merge of `mean` and `stdevs`  |
| `relevantSet`         | Extraction of only mean and std variables from `fullSet`      |
| `actNamesTest`       | Activity names joined to `test` data       |
| `actNamesTrain`       | Activity names joined to `train` data         |
| `actNames`       | Merge of `actNamesTest` and `actNamesTrain`, named `activityType` in the data frame  |
| `subject`       | Merge of `testSub` and `trainSub`        |
| `tidySet`      | Means of all variables grouped by factors `subject` and `activityType`       |

###Output
`tidySet` is printed to tidydata.txt
