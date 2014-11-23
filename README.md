This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in Coursera.
The dataset being used is: Human Activity Recognition Using Smartphones.
The script run_analysis.Rperforms the 5 steps described in the course project's definition.

1- All the similar data is read with read.table function and is merged using the rbind() function. By similar, we address 
those files having the same number of columns and referring to the same entities.
2- Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. 
3- As activity data is addressed with values 1:6, we take the activity names and 
IDs from activity_labels.txt and they are substituted in the dataset.
4- After extracting point nr 2 columns, they are given the correct names, taken from features.txt.
On the whole dataset, those columns with vague column names are corrected.

Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). 
The output file is called tidy_data.txt, and uploaded to this repository.