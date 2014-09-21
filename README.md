HOW THE SCRIPT WORKS
=========================

This is a part of coursera "Getting and Cleaning data" course project
This script assumes being present in the main directory of the data set (UCI HAR Dataset)

Using read.table(), it first loads the data sets for traing and testing as well as activity list and subject list and the data corresponding activity number to its name

it then adds infront two columns for Subject and Activity, and then changes the numbers of activity by its name referenced in the activity labels

then using rbind(), both sets are combined into main set named DataSet
The variable names are extracted from file features.txt and stored in vars data frame, then the same name was used to 
store the vector from the aforementioned data frame which actually contains the name

then using vars names vector, the script applies it to the names of columns of the main DataSet with added first Subject and Activity labels

Then using grepl, it extract only those fields with names containing mean or std or Activity or Subject to keep the referneces to subject and Activity

Then Data is melted by Activity and Subject, and casted (by melt, dcast,  package reshape2) for all variables applying mean function
the resulting data now stored in CastedDataSet is saved into txt file course_project by the function write.table


