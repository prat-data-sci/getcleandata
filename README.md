## READ ME

### The dataset getting and cleaning process utilizes the following files:

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

### The script follows the steps listed below in sequence

* load library(dplyr)
* get the training features data
*  get the test features data
* combine training and test data
*  get the features variable names
*  set variable names to combined df
*  select the measurements that have mean variables
*  select the measurements that have std variables
* combine the mean and std measurements variables
* get the subject data
* combine training and test subject data
* set the col name
* get the activity data
* combine training and test activity data
* set the col name
* combine columns of data set, subject and activity
* order df
* get activity labels to give descriptive names
* set the descriptive col name
* merge combined data with activity label data
* write the tidy dataset to text file for distribution



