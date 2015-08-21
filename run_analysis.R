## Course project for Getting and cleaning data
## R scrip
## step1-read and merge data
## step2-extract columns with only mean and std in the name
## step3-name activities appropriately 
## step4-name the variables appropriately
## step5 -create tidy data set with the average of each variable 
## for each activity and each subject.

## Code
## Step 1:Merge the train and test data into one data-set
# read train data sets, rename activity and subjects columns, merge
x_train<-read.table("UCIHARDataset/train/X_train.txt")
y_train<-read.table("UCIHARDataset/train/y_train.txt")
sub_train<-read.table("UCIHARDataset/train/subject_train.txt")

names(y_train)<-c("activity")
names(sub_train)<-c("subjects")

train_data<-cbind(x_train,y_train,sub_train)

# read test data sets, rename activity and subjects columns, merge
x_test<-read.table("UCIHARDataset/test/X_test.txt")
y_test<-read.table("UCIHARDataset/test/y_test.txt")
sub_test<-read.table("UCIHARDataset/test/subject_test.txt")

names(y_test)<-c("activity")
names(sub_test)<-c("subjects")

test_data<-cbind(x_test,y_test,sub_test)

all_data<-rbind(train_data,test_data)

## Step 2: Extracts only the columns
## on the mean and standard deviation for each measurement. 
## Note: as the columns are renamed in step 4, work with column numbers,e.g V1,V2,V3..

# read the names of variables from feature table (column names of x_ table) 
feat_names<-read.table("UCIHARDataset/features.txt")

# res: logical vector which marks if variable contains "mean" or "std" with 1
res1<-sapply(feat_names$V2,function(x) sum(grep(c("std"),as.character(x))))
res2<-sapply(feat_names$V2,function(x) sum(grep(c("mean"),as.character(x))))
res3<-sapply(feat_names$V2,function(x) sum(grep(c("meanFreq"),as.character(x))))
#res<-res1+res2
res<-res1+res2-res3 ##if I want to remove meanFreq()

# subset "mean" and "std" column numbers ($V1) 
# from features table applying res as a mask on V1
feat_small<-subset(feat_names,feat_names$V1*res>0)

# subset these column numbers from all_data. Add activity and subjects
keep_columns<-c(feat_small$V1,562,563)
small_data<-all_data[,c(feat_small$V1,562,563)]

## Step 3.Uses descriptive activity names to name the activities in the data set
# read activities from file, rename, convert to factor
activity_names<-read.table("UCIHARDataset/activity_labels.txt")
activity_names<-tolower(sub("_",".",activity_names[,2]))

small_data$activity <-factor(small_data$activity,1:6,activity_names)
small_data$subjects<-as.factor(small_data$subjects)

## Step 4: Appropriately label the data set with descriptive variable names. 
# read the selected features' names, rename, set as column names
feat_small_names<-as.character(feat_small[,2])
feat_small_names<-sub('-mean\\(\\)','Mean',feat_small_names)
feat_small_names<-sub('-std\\(\\)','Std',feat_small_names)
feat_small_names<-sub('-','',feat_small_names)

colnames(small_data)[1:66]<-feat_small_names

## Step 5: From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
library(dplyr)
dt<-tbl_df(small_data)
tidy_data<-dt%>% group_by(subjects,activity) %>% summarise_each(funs(mean))
write.table(tidy_data,"tidy_data.txt",row.name=FALSE)
