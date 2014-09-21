TRAINING = read.table("train/X_train.txt")
TESTING = read.table("test/X_test.txt")
DataSet = rbind(TRAINING,TESTING)
vars = read.table("features.txt")
vars = vars[,2]
names(DataSet) = vars
MeanNstd = DataSet[,grepl( "mean" , names( DataSet ) ) | grepl( "std" , names( DataSet ) )]
AvgData = sapply(MeanNstd, mean)
write.table(AvgData, file = "course_project.txt", row.name=FALSE)
