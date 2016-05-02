#load necessary libraries
library(reshape2)

#Download files

#Create vector of variable names
varnames <- read.table("./UCI HAR Dataset/features.txt")

#Create full test data frame
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
testids <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testactivities <-read.table("./UCI HAR Dataset/test/y_test.txt")
names(test) <- varnames[,2]
test <- cbind(testids,testactivities,test)
names(test)[1:2] <-c("id","activity")

#Create full training data frame
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainids <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainactivities <-read.table("./UCI HAR Dataset/train/y_train.txt")
names(train) <- varnames[,2]
train <- cbind(trainids,trainactivities,train)
names(train)[1:2] <-c("id","activity")

#Combine test and training files
my_data <-rbind(train,test)

#Keep only activity, id, mean, and std variables
my_data <- my_data[,c(1,2,grep("mean\\(\\)",names(my_data)),grep("std\\(\\)",names(my_data)))]

#Use descriptive activity names to name the activities in the data set
my_data[,2] <- as.factor(my_data[,2])
levels(my_data[,2]) <- c("walking","walkingupstairs","walkingdownstairs","sitting","standing","laying")

#Rename variables with descriptive names
names(my_data) <- gsub("fBody","frequencybody",names(my_data))
names(my_data) <- gsub("tBody","timebody",names(my_data))
names(my_data) <- gsub("fGravity","frequencygravity",names(my_data))
names(my_data) <- gsub("tGravity","timegravity",names(my_data))
names(my_data) <- gsub("-","",names(my_data))
names(my_data) <- gsub("Mag",",magnitude",names(my_data))
names(my_data) <- gsub("Acc","accelerometer",names(my_data))
names(my_data) <- gsub("Gyro","gyroscope",names(my_data))
names(my_data) <- gsub("Jerk","jerk",names(my_data))
names(my_data) <- gsub("fBody","frequencybody",names(my_data))
names(my_data) <- gsub("\\(\\)","",names(my_data))
names(my_data) <- gsub("\\,","",names(my_data))
names(my_data) <- tolower(names(my_data))

#Create second data set
my_data_melt <- melt(my_data,id=c("id","activity"))
new_data <- dcast(my_data_melt, id + activity ~ variable, fun.aggregate = mean,na.rm = TRUE)

                             