rm(list=ls())

#===
#1. Merges the training and the test sets to create one data set.

#Read all relevant files
x_test<-read.table("./test/X_test.txt")
y_test<-read.table("./test/Y_test.txt")
subject_test<-read.table("./test/subject_test.txt")
x_train<-read.table("./train/X_train.txt")
y_train<-read.table("./train/Y_train.txt")
subject_train<-read.table("./train/subject_train.txt")
activity<-read.table("./activity_labels.txt")
features<-read.table("./features.txt")

#Rename columns
colnames(y_test) = "activity_id"
colnames(y_train) = "activity_id"
colnames(x_test) = features[,2]
colnames(x_train) = features[,2]
colnames(subject_test) = "subject_id"
colnames(subject_train) = "subject_id"

#Create the "test" and "train" tables.
test_only<-cbind(subject_test, y_test, x_test)
train_only<-cbind(subject_train, y_train, x_train)

#Combine the data of the "test" and "train" tables.
combined<-rbind(test_only, train_only)

#===
#2. Extracts only the mean and standard deviation of each measurement.

#Makes a text vector containing the combined table's column names.
colnames<-names(combined)

#Makes a logical vector that returns TRUE if the column
#contains mean or standard deviation. Also returns TRUE for 
#the subject_id and activity columns. Returns false for others.
tf<-grepl("[Mm]ean|[Ss]td|^subject_id|^activity", colnames) & !grepl("[Mm]ean[Ff]req|BodyAccMean|gravityMean", colnames)

#subsets the columns with subject_id, activity, mean, and standard deviation data.
extracted<-combined[,tf]

#===
#3. Uses descriptive activity names to name the activities in the data set

#Change column names of 'activity'.
colnames(activity)<-c('activity_id', 'activity_name')

#Add the new column containing descriptive activity names to the dataset.
described<-merge(extracted, activity, by='activity_id', all.x=TRUE)

#===
#4. Appropriately label the dataset with descriptive activity names.

#Replaces messy sections of column names with clearer ones.
colnames(described)<-gsub("\\()", "", colnames(described))
colnames(described)<-gsub("mean", "Mean", colnames(described))
colnames(described)<-gsub("std", "StdDev", colnames(described))
colnames(described)<-gsub("^t", "Time-", colnames(described))
colnames(described)<-gsub("^f", "Frequency-", colnames(described))
colnames(described)<-gsub("X$", "XDirection", colnames(described))
colnames(described)<-gsub("Y$", "YDirection", colnames(described))
colnames(described)<-gsub("Z$", "ZDirection", colnames(described))
colnames(described)<-gsub("[Mm]ag", "Magnitude", colnames(described))
colnames(described)<-gsub("[Aa]cc", "Acceleration", colnames(described))
colnames(described)<-gsub("[Bb]ody[Bb]ody|[Bb]ody", "Body", colnames(described))

#===
#5. From the data set in step 4, creates a second, independent tidy data set with the average
#of each variable for each activity and each subject.

#Creates a vector containing TRUE if the column name has "Mean" in it, as
#well as the "activity_id", "subject_id", and "activity_name" columns.
tf<-grepl("Mean|^activity_id|^subject_id|^activity_name", colnames(described))

#Isolates columns containing means, activity_id, subject_id, and activity_name.
final<-described[tf]

#Reorder columns so activity_name is beside activity_id
tidy_data<-final[,c(1,36,2,3:35)]

