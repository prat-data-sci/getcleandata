
library(dplyr)

# get the training features data
df_train_data <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

# get the test features data
df_test_data <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

# combine training and test data
df_combined_data <- rbind(df_train_data, df_test_data)

# get the features variable names
df_var <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

# set variable names to combined df
cvar <- df_var[,2]
colnames(df_combined_data) <- cvar

# select the measurements that have mean variables
df_filter_meanVar <- df_combined_data[ , grepl( "mean()" , names( df_combined_data ) ) ]

# select the measurements that have std variables
df_filter_stdVar <- df_combined_data[ , grepl( "std()" , names( df_combined_data ) ) ]

# combine the mean and std measurements variables
df_combined_data_meanstd <- cbind(df_filter_meanVar,df_filter_stdVar)

# get the subject data
df_subtrain <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
df_subtest <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

# combine training and test subject data
df_combined_sub <- rbind(df_subtrain,df_subtest)

# set the col name
colnames(df_combined_sub) <- "subjectId"

# get the activity data
df_ytrain <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
df_ytest <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

# combine training and test activity data
df_combined_act <- rbind(df_ytrain,df_ytest)

# set the col name
colnames(df_combined_act) <- "activityId"


# combine columns of data set, subject and activity
df_combined_all <- cbind(df_combined_data_meanstd, df_combined_sub, df_combined_act)

# order df
df_ord <- df_combined_all[order(df_combined_all$activityId),]

# get activity labels
df_act_lab <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

# set the col name
colnames(df_act_lab) <- c("activityId","activityLabel")

# merge combined data with activity label data
df_combined_all_label <- merge(df_ord,df_act_lab,by.x="activityId",by.y="activityId")

# get into data table
dt <- tbl_df(df_combined_all_label)

# group by subject, activity
dt1 <- group_by(dt,subjectId,activityLabel)

# get average of all variables by subject, activity
dt2 <- colMeans(dt1)

dt3<- select(dt2,81,82,2:80)

# Write dataset to file 
write.table(dt3,"tidydata.txt",row.name=FALSE)


