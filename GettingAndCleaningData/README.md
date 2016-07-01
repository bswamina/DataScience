###
### Coursera: Getting and Cleaning Data Course - Programming Assignment - README.md
###

This programming assignment submission includes 3 files:

* __README.md__ (this file)
* __CodeBook.md__
* __run_analysis.R__

#### __CodeBook.md__

This file is the code book that lists all the variables for the two datasets we generate from this assignment.

#### __run_analysis.R__

This **R** script will process the downloaded dataset to produced the two dataset files:

1. __final_merged.txt__ - contains all the rows merged from the `test` and `train` datasets and contains variables subject, activity, and all the mean and the std measurements
2. __final_summary.txt__ - contains the average for each variable in __final_merged.txt__ grouped by subject and activity

The __run_analysis.R__ script performs the following activities to produced the desired result:

1. Loads the library dplyr
2. Initializes few global variables (that contain the full path for all the files being read and written)
3. Load the activity id and labels to a dataframe
4. Load the feature id and labels to a dataframe
5. Load the test dataset - subject, activity, & data
    + Load the test subjects to a dataframe
    + Load the test activity ids to a dataframe
    + Load the test dataset to a dataframe
6. Create a new test dataset which combines the subject, activity, & data into one dataframe
7. Load the train dataset - subject, activity, & data
    + Load the train subjects to a dataframe
    + Load the train activity ids to a dataframe
    + Load the train dataset to a dataframe
8. Create a new train dataset which combines the subject, activity, & data into one dataframe
9. Combine the datasets created in steps 6 and 8 above to create a full dataset
10. Select all the column names that represent the mean and the standard deviation as well as subject and activity from the full dataset created in step 9 above
11. Create a new tidy dataset by selecting all columns identified in step 10 from the full dataset created in step 9
12. Clean the column names (by removing dashes and parenthesis and capitalizing the words mean and std) from the tidy dataset created in step 11
13. Write the output of the tidy merged dataset to a file __final_merged.txt__
14. Create a new summary dataset from the tidy merged dataset (from step 12) with the averages of all the variables grouped by the subject and the activity
15. Adjust the columns names with a suffix _.Avg_ for all but subject and activity
16. Write the output of the summary dataset (from step 15 above) to a file __final_summary.txt__

#### Pre-requisites

Ensure you have installed the package __dplyr__ and all its dependencies.

#### Instructions for the execution

The following are the instructions on how to setup and run the __run_analysis.R__ script:

1. Create a directory for this project, say, __gcd_project__ (we will refer to this in the following steps)
2. Copy the __run_analysis.R__ script from the github repo https://github.com/bswamina/GettingAndCleaningData.git into the __gcd_project__ directory
3. Download the data for this project from the site https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to the directory __gcd_project__
4. Extract the contents of the __zip__ file downloaded in step 2 in the directory __gcd_project__. This will create a sub-directory called __UCI HAR Dataset__ with all the data
5. Launch __RStudio__ and set the working directory to __gcd_project__ using the `setwd` command
6. Source the script __run_script.R__ from the directory __gcd_project__. This will execute the R script and process the data files
    + One should see an output something as follows:
```
[1] "Loading the file ~/Downloads/UCI HAR Dataset/activity_labels.txt ..."
[1] "Loading the file ~/Downloads/UCI HAR Dataset/features.txt ..."
[1] "Loading the file ~/Downloads/UCI HAR Dataset/test/subject_test.txt ..."
[1] "Loading the file ~/Downloads/UCI HAR Dataset/test/y_test.txt ..."
[1] "Loading the file ~/Downloads/UCI HAR Dataset/test/X_test.txt ..."
[1] "Creating the test dataset..."
[1] "Done creating the test dataset."
[1] "Loading the file ~/Downloads/UCI HAR Dataset/train/subject_train.txt ..."
[1] "Loading the file ~/Downloads/UCI HAR Dataset/train/y_train.txt ..."
[1] "Loading the file ~/Downloads/UCI HAR Dataset/train/X_train.txt ..."
[1] "Creating the train dataset..."
[1] "Done creating the train dataset."
[1] "Creating the full merged dataset..."
[1] "Done creating the full merged dataset."
[1] "Selecting the mean & std measurements from the full merged dataset..."
[1] "Preparing a final dataset with subject, activity, the mean & std measurements..."
[1] "Preparing to clean the column names for the final dataset..."
[1] "Preparing to write the final merged dataset file ~/Downloads/final_merged.txt ..."
[1] "Done writing the file final_merged.txt !!!"
[1] "Done writing file ~/Downloads/final_merged.txt."
[1] "Preparing the dataset with mean values grouped by subject/activity..."
[1] "Preparing to clean the column names for summary dataset..."
[1] "Preparing to write the final summary dataset file ~/Downloads/final_summary.txt ..."
[1] "Done writing file ~/Downloads/final_summary.txt."
[1] "SUCCESS !!!"
```

#### Results

One should see two files - __final_merged.txt__ and __final_summary.txt__ - the desired tidy datasets

