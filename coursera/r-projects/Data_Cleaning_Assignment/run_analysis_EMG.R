# Making two files: test_data and train_data
# Installing the necesary packages and loading them.

require(plyr, quietly=TRUE, warn.conflicts=FALSE)
require(tidyr, quietly=TRUE, warn.conflicts=FALSE)

library("plyr")
library("tidyr")

# finds the location of this active R script on the user computer and sets
# the working directory to files location. Note: this is written for an OS device.

address<-system("find /Users -name run_analysis_EMG.R",intern=TRUE)
length1<-nchar(address)
length2<-nchar("run_analysis_EMG.R")+1
address<-paste0(strtrim(address, length1-length2)[1],"/UCI HAR Dataset")
setwd(address)

All_files<-list.files(path=".",recursive=TRUE)  # Reading all the text files in
variables_name<-read.table(All_files[3])  # read all the variable names.


# Combining the activity list with trained x-data
# change of column names
# step 4, adding descriptive colnames is done here.

datax_train<-read.table(All_files[27])  
colnames(datax_train)<-as.character(variables_name[,2])  
datay_train<-read.table(All_files[28])
subjects<-read.table(All_files[26])
colnames(subjects)[1]<-"subject"
colnames(datay_train)[1]<-"activity"
Train<-cbind(datay_train,subjects,datax_train)   

# Combining the activity list with test x-data
# change of column names
# step 4, adding descriptive colnames is done here.

datax_test<-read.table(All_files[15])
colnames(datax_test)<-as.character(variables_name[,2])
datay_test<-read.table(All_files[16])
subjects<-read.table(All_files[14])
colnames(subjects)[1]<-"subject"
colnames(datay_test)[1]<-"activity"
Test<-cbind(datay_test,subjects,datax_test)

# Step 1. Merges the training and the test sets to create one data set.

Total_data<-rbind(Test,Train)

# Step 2. Selecting the columns with mean and standard deviation

colnumbers<-c(1:2,sort(c(grep("mean",colnames(Total_data),ignore.case=TRUE),grep("std",colnames(Total_data),ignore.case=TRUE))))
ms<-Total_data[,colnumbers]

# Step 3. changing factor levels 1:6 as activity to descriptive levels

ms$activity<-as.factor(ms$activity)   
levels(ms$activity)<-c("Walking","Walking_upstairs","Walking_downstairs","Sitting","Standing","Laying")


# Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Writting it into 
data_tidy<-m<-ddply(ms,.(subject,activity),function(x) apply(x[,3:88],2,mean))
write.table(data_tidy,file="data_tidy.txt",row.name=FALSE)


