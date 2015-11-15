# GetData_Project
Files related with Getting and Cleaning Data Course Project

run_analysis.R          R script for analysing data from UCI HAR Dataset
tidydata.txt            summarised dataset obtained as output
code_book.txt           description of variables in tidydata.txt

## Script Description

The script is structured in several steps:

Step 1: reading and merging
- reads all the test and train datasets about measurements, subjects and activities
- joins each train and test dataset in complete datasets
- deletes test and train dataset

Step 2: extracting mean and std measurements
- reads features dataset to name variables in measurements dataset
- extracts measurements on mean and standard deviation

Step 3/4: labeling and merging
- reads labels for activities
- names subjects and activities datasets
- changes id activities to label activities
- joins measurements, subjects and activities datasets

Step 5: summarizing measurements
- builds a melt dataset usind id variables subject and activity
- summarizes the average measurements for each subject and activity
- writes file with tidy data
