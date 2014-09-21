library(reshape2)

X_train <- read.table("train/X_train.txt", quote="\"")
X_test <- read.table("test/X_test.txt", quote="\"")
y_test <- read.table("test/y_test.txt", quote="\"")
y_train <- read.table("train/y_train.txt", quote="\"")
subject_train <- read.table("train/subject_train.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")

TEST = cbind(subject_test,y_test, X_test)
TRAIN = cbind(subject_train,y_train, X_train)
DataSet = rbind(TRAIN, TEST)

activity_labels <- read.table("activity_labels.txt", quote="\"")

features <- read.table("features.txt", quote="\"")
Vars = features[,2]
names(DataSet) = c("Subject", "Activity", as.vector(vars))
DataSet$Activity = activity_labels[DataSet$Activity,2]
DataSet = DataSet[,grepl( "mean()" , names( DataSet ) ) | grepl( "std()" , names( DataSet )) 
                  |grepl( "Activity" , names( DataSet )) | grepl( "Subject" , names( DataSet ) ) ]

MeltedDataSet <- melt(DataSet, id = c("Subject", "Activity"))
CastedDataSet <- dcast(MeltedDataSet, Subject + Activity ~ variable, mean)



write.table(CastedDataSet, file = "course_project.txt", row.name=FALSE)
