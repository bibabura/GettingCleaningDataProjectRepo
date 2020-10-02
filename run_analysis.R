
#creating directory
if(!file.exists("./data")){dir.create("./data")}

#setting url for download
theUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#downloading url
download.file(theUrl,destfile="./data/Dataset.zip",method="curl")

#unzipping
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#view dataset files
path_rf <- file.path("./data" , "UCI HAR Dataset")
fileslst<-list.files(path_rf, recursive=TRUE)
fileslst

#Read data from the files into the R objects (variables)
#assigning Activity, Subject and Features test and train datasets
ActDataTest  <- read.table(file.path(path_rf, "test" ,
                                          "Y_test.txt" ),header = FALSE)
ActDataTrain <- read.table(file.path(path_rf, "train",
                                          "Y_train.txt"),header = FALSE)
SubjDataTrain <- read.table(file.path(path_rf, "train",
                                         "subject_train.txt"),header = FALSE)
SubjDataTest  <- read.table(file.path(path_rf, "test" ,
                                         "subject_test.txt"),header = FALSE)
FeatDataTest  <- read.table(file.path(path_rf, "test" ,
                                          "X_test.txt" ),header = FALSE)
FeatDataTrain <- read.table(file.path(path_rf, "train",
                                          "X_train.txt"),header = FALSE)

#Project Question 1:Merges the training and the test sets to create one data set
#Concatenate the data tables by rows

MergeDataSubj <- rbind(SubjDataTrain, SubjDataTest)
MergeDataAct<- rbind(ActDataTrain, ActDataTest)
MergeDataFeat<- rbind(FeatDataTrain, FeatDataTest)

#set names to variables

names(MergeDataSubj) <- c("subject")
names(MergeDataAct)<- c("activity")
MergeDataFeatNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(MergeDataFeat) <- MergeDataFeatNames$V2

#Merge columns to get the data frame Data for all data

CombineData <- cbind(MergeDataSubj, MergeDataAct)
Data <- cbind(MergeDataFeat, CombineData)

#Project Queston2: Extracts only the measurements on the mean and standard deviation
#for each measurement.

#Subset Name of Features by measurements on the mean and standard deviation
#i.e taken Names of Features with "mean()" or "std()"

subMergeDataFeatNames<-MergeDataFeatNames$V2[grep("mean\\(\\)|std\\(\\)",
                                                MergeDataFeatNames$V2)]

#Subset the data frame Data by seleted names of Features
selectedNames<-c(as.character(subMergeDataFeatNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

#Check the structures of the data frame Data
str(Data)

#Project Question3: Uses descriptive activity names to name the activities in
#the data set

#Reading descriptive activity names from "activity_labels.txt"

#activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),
#                             header = FALSE)

#facorize Variable activity in the data frame Data using descriptive activity names


Data$activity <- factor(Data$activity, labels=c("Walking","Walking Upstairs", 
                                     "Walking Downstairs", "Sitting", 
                                     "Standing", "Laying"))

head(Data$activity,30)

#Project Question 4: Appropriately labels the data set with descriptive variable names

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

#check
names(Data)


#Project Question5: From the data set in step 4, creates a second, independent tidy
#data set with the average of each variable for each activity and each subject.
library(plyr);
TData2<-aggregate(. ~subject + activity, Data, mean)
TData2<-TData2[order(TData2$subject,TData2$activity),]
write.table(TData2, file = "tidydata.txt",row.name=FALSE)


#______________DONE WITH THE PROJECT__________________