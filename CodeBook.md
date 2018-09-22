Variable names:

path = path of the data folder
subject_train = dt for subject_train.txt file
subject_test = dt for subject_test.txt file
x_train = dt for x_train.txt file
y_train = dt for y_train.txt file
x_test = dt for x_test.txt file
y_test = dt for y_test.txt file

subject = combo of subject_train & subject_test tables
x = combo of x_train & x_test tables
y = combo of y_train & y_test tables

features = dt for features.txt file
my_features = dt features for mean & std
my_features_vector = convert my_features into vector
my_features_dt = only select features for mean & std from table x

activity_labels = dt for activity_labels.txt file
dt_activity = merge of activity_labels and table y

my_features_names = names of all the features for mean & std
dt_clean = tidy dt for features and activities
dt_clean_means = tidy dt with average of each variable for each activity and each subject

