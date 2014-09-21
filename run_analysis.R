#loads the library necessary for mel and dcast functions

library(reshape2)

#loading the data sets training, testing, activity code and subject code

X_train <- read.table("train/X_train.txt", quote="\"")
X_test <- read.table("test/X_test.txt", quote="\"")
y_test <- read.table("test/y_test.txt", quote="\"")
y_train <- read.table("train/y_train.txt", quote="\"")
subject_train <- read.table("train/subject_train.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")

# adding subject and activity columns to test and train data
TEST = cbind(subject_test,y_test, X_test)
TRAIN = cbind(subject_train,y_train, X_train)

#combining train and test data into the main DataSet
DataSet = rbind(TRAIN, TEST)

#loads the activity lables data
activity_labels <- read.table("activity_labels.txt", quote="\"")

#loading variable names
features <- read.table("features.txt", quote="\"")

#extracting variable names 
Vars = features[,2]

#adding the column (variable) names to the data set
names(DataSet) = c("Subject", "Activity", as.vector(vars))

#changing the activity code number by activity label
DataSet$Activity = activity_labels[DataSet$Activity,2]

#extracting only the columns Subject Activity and those with std or mean in their variable name
DataSet = DataSet[,grepl( "mean()" , names( DataSet ) ) | grepl( "std()" , names( DataSet )) 
                  |grepl( "Activity" , names( DataSet )) | grepl( "Subject" , names( DataSet ) ) ]

#melting the data for Subject and Activity
MeltedDataSet = melt(DataSet, id = c("Subject", "Activity"))

#using melted data to do mean of variables according to grouping by subject and Activity

CastedDataSet = dcast(MeltedDataSet, Subject + Activity ~ variable, mean)


# the final Data set is stored into a text file, this txt is uploaded to course project
write.table(CastedDataSet, file = "course_project.txt", row.name=FALSE)
