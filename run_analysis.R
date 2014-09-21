TRAINING = read.table("train/X_train.txt")
TESTING = read.table("test/X_test.txt")
DataSet = rbind(TRAINING,TESTING)
vars = read.table("features.txt")
vars = vars[,2]
step3data = DataSet[,grepl( "mean" , names( DataSet ) ) | grepl( "std" , names( DataSet ) )]
step5data = sapply(step3data, mean)
write.table(step5data, file = "course_project.txt", row.name=FALSE)
