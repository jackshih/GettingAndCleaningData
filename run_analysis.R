path <- file.path(getwd(), "data")
subject_train <- read.table(file.path(path, "train", "subject_train.txt"))
subject_test <- read.table(file.path(path, "test", "subject_test.txt"))
x_train <- read.table(file.path(path, "train", "x_train.txt"))
y_train <- read.table(file.path(path, "train", "y_train.txt"))
x_test <- read.table(file.path(path, "test", "x_test.txt"))
y_test <- read.table(file.path(path, "test", "y_test.txt"))

#1. Merges the training and the test sets to create one data set.
subject <- rbind(subject_train, subject_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table(file.path(path, "features.txt"))
my_features <- subset(features, grepl("mean\\(\\)|std\\(\\)", V2))
my_features_vector <- my_features[,1]
my_features_dt <- x[,my_features_vector]

#3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table(file.path(path, "activity_labels.txt"))
dt_activity <- merge(activity_labels, y, by="V1", all.x = TRUE)

#4. Appropriately labels the data set with descriptive variable names.
my_features_names <- my_features[,2]
colnames(my_features_dt) <- my_features_names
colnames(dt_activity)[1] <- "activity_id"
colnames(dt_activity)[2] <- "activity"
dt_clean <- cbind(dt_activity, my_features_dt)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dt_clean_means <- aggregate(dt_clean[, 3:68], list(dt_clean$activity), mean)
dt_clean_means