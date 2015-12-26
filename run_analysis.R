# Getting and cleaning data, Dec 2015, JHU Data Science / Coursera
# Please place this script inside the UCI HAR Dataset folder
# (i.e. in the same directory level as README.txt)

# The structure of the data:
# X_[train/test].txt - each row corresponds to a subject (subject_[test/train].txt)
# and additionally a type of activity (y_[test/train].txt).
# each column corresponds to a feature readout of the sensor

# http://stackoverflow.com/questions/7029800/how-to-run-tapply-on-multiple-columns-of-data-frame-using-r
# http://stackoverflow.com/questions/33363065/apply-a-column-wise-function-in-a-list-of-data-tables

library(data.table)

# read in the labels for the X data set
fpath <- file.path("UCI HAR Dataset","activity_labels.txt")
activity_labels <- fread(fpath)
fpath <- file.path("UCI HAR Dataset","features.txt")
features <- fread(fpath)
features <- features$V2

# read in the X train/test data set
X_train <- file.path("UCI HAR Dataset","train","X_train.txt")
X_test <- file.path("UCI HAR Dataset","test","X_test.txt")

# read in subject row labels
fpath <- file.path("UCI HAR Dataset","train","subject_train.txt")
subject_train <- fread(fpath,col.names = "Subjects")
fpath <- file.path("UCI HAR Dataset","test","subject_test.txt")
subject_test <- fread(fpath,col.names = "Subjects")

# read in the type of activity row labels
y_train <- file.path("UCI HAR Dataset","train","y_train.txt")
y_test <- file.path("UCI HAR Dataset","test","y_test.txt")

# label the data sets by Training or Test group
subject_test$Group = "Test"
subject_train$Group = "Train"

# Bind the datasets together
# Bind the results of fread to avoid creating variables
subject_all <- rbind(subject_test,subject_train)
subject_list <- unique(subject_all)
subject_list <- subject_list[order(subject_list$Subjects),]
subject_all$Subjects <- factor(subject_all$Subjects,
                               sort(unique(subject_all$Subjects)))

# bind subject, y, and X together, but only with mean() and std() "features"
# X and y are supplied as a rbind of two freads
library(dplyr)
full_data <- cbind(subject_all,
                   rbind(fread(y_test,col.names = "Activity"),
                         fread(y_train,col.names = "Activity")),
                   select(rbind(fread(X_test,col.names = features),
                                fread(X_train,col.names = features)),
                          contains("mean()"),contains("std()")))

# factorize the Activity column
full_data$Activity <- factor(full_data$Activity,
                             activity_labels$V1,
                             labels = activity_labels$V2)

# make a second, independent data set
# each subject has multiple rows where they are performing the same 
# activity.

# use split to separate full_data into separate subjects
avg_data <- split(full_data,full_data$Subjects)

# list apply (lapply) a function that uses data.table nomenclature
# to take the mean of each feature, grouped by activity
# .SDcols = 4:69 skips the character columns (Subject, Group, Activity)
avg_data <- lapply(avg_data,function(x) x[, lapply(.SD, mean), by=Activity, .SDcols=4:69])

# reinsert columns for subject and group
avg_data <- mapply(cbind,
                   Subjects = subject_list$Subjects,
                   Group = subject_list$Group,
                   avg_data,SIMPLIFY = FALSE)

# convert the list back to a single data frame
avg_data <- rbindlist(avg_data)

# remove any instances of "()" from the features list, as read.table turns
# () into .. via the check.names option
names(avg_data) <- gsub("()", "", names(avg_data), fixed="TRUE")

# write the result to a " " delimitted file X_avg
write.table(avg_data,"X_avg.txt", row.names=FALSE, quote=FALSE)