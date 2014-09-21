HOW THE SCRIPT WORKS
=========================

This is a part of coursera "Getting and Cleaning data" course project
This script assumes being present in the main directory of the data set (UCI HAR Dataset)

Using read.table(), it first loads the data sets for traing and testing and stores them into TRAINING and TESTING
data frames

then using rbind(), both sets are combined into main set named DataSet
The variable names are extracted from file features.txt and stored in vars data frame, then the same name was used to 
store the vector from the aforementioned data frame which actually contains the name

then using vars names vector, the script applies it to the names of columns of the main DataSet
MeanNstd is created to extract those columns from the main DataSet where name contains either mean or std
as per step 5, a variable AvgData was created to summerize the averages of the MeanNstd data extracted previously
the script uses sapply() function to apply mean() upon all columns
