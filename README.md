The goal is to prepare tidy data that can be used for later analysis. The following things are to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

An R script called run_analysis.R that does the following:

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive activity names.
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The approach is as follows:

    Download the dataset and save it in the wd
    rbind two data files to fullfill requirement 1
    Take only std() and mean() features, subset the dataset, thus fulfilling requirement 2; the result is in mean_and_std
    Load the activity labels, and replace indices with names. 
    Combines the labels and the data set using cbind; doing that for both mean_and_std and X. 
    Using the X, calculating an aggregate using mean for averaging per each activity and subject; then save the result to a file called results.txt
    
