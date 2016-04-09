#Jeff P Getting and Cleaning Data Assignment. For more information, please see README.md and CodeBook.md


# Call packages, Set working directory, check for, download, and unzip file
library(reshape2)

mydirectory <- "C:/Users/jeff.JNB/Desktop/R Class/GCD"
setwd(mydirectory)

myfile <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dlfile <- "w4project.zip"

if(!file.exists("w4project.zip")) {download.file(url = myfile, destfile =dlfile)}
zipfile <- "UCI HAR Dataset"

if(!file.exists(zipfile)) {unzip(dlfile)}
setwd(zipfile)


#Read in Test Data
setwd("Test")
testx <- read.table("X_test.txt")
testy <- read.table("y_test.txt")
testsubject <- read.table("subject_test.txt")
setwd('..')

#Read in Train Data
setwd("Train")
trainx <- read.table("X_train.txt")
trainy <- read.table("y_train.txt")
trainsubject <- read.table("subject_train.txt")
setwd('..')

#Read in Labels & Features
key <- read.table("activity_labels.txt")
feat <- read.table("features.txt")

#Add names to columns
colnames(testsubject) <- "Subject_ID"
colnames(testx) <-feat[,2] #names each variable from feature
colnames(testy) <- "Activity_Label"
colnames(trainsubject) <- "Subject_ID"
colnames(trainx) <-feat[,2] #names each variable from feature
colnames(trainy) <-"Activity_Label"

#Apply Labels to Activities [Assignment Step 3]
testy[,1] <- factor(testy[,1], levels =key[,1], labels = key[,2])
trainy[,1] <- factor(trainy[,1], levels =key[,1], labels = key[,2])

#Create list of desired vairables [Assignment Step 2]
vlist <- grep("*mean[^Freq]|*std*",feat[,2])

#Trim data to include only desired variables
finaltestx <- testx[,vlist]
finaltrainx <-trainx[,vlist]

#merge test into one dataset
testset <- cbind(testsubject,finaltestx,testy)

#merge train into one dataset
trainset <-cbind(trainsubject,finaltrainx,trainy)

#create master dataset [Assignment Step 1]
masterset <-rbind(testset,trainset)

#Appropriately Label Variable Names [Assignment Step 4]
x <- c(colnames(masterset))
colnames(masterset) <- gsub("*-mean()*","Mean_Value", x)
x <- c(colnames(masterset))
colnames(masterset) <- gsub("*std()","STD_Value",x)

#Create Tidy Data Set of Averages by Activity by Subject for all Vars [Assignment Step 5]
mastermelt <- melt(data = masterset, id=c("Subject_ID", "Activity_Label"))
tidy <- dcast(mastermelt,Subject_ID+Activity_Label ~variable,mean)
write.table(tidy,"tidy.txt", row.names = FALSE)

