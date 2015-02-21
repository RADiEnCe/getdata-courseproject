setwd("~/datascience/getdata/cp") # this is my working directory
# the dataset is in the folder 'cp', contained with another folder
# called 'dataset'

# prepare data cache for the most cumbersome data
if(!exists("X_test_cache")) {
  X_test_cache <- read.table("dataset/test/X_test.txt",
                             colClasses = "numeric")
}
if(!exists("X_train_cache")) {
  X_train_cache <- read.table("dataset/train/X_train.txt",
                              colClasses = "numeric")
}


# make a copy from cache to actually operate on
X_test <- X_test_cache
X_train <- X_train_cache

# read the rest of the data
y_test <- read.table("dataset/test/y_test.txt")
y_train <- read.table("dataset/train/y_train.txt")
subject_test <- read.table("dataset/test/subject_test.txt")
subject_train <- read.table("dataset/train/subject_train.txt")
features <- read.table("dataset/features.txt",
                       colClasses = "character")[,2]
activity_labels <- read.table("dataset/activity_labels.txt")

#mearge x, y, subject over test and train, with test always coming first
X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)[,1]


# construct column filters for mean and std in X and combine them
# grep gives a list of indexes that match
meanfilt <- grep("mean()", features, fixed = TRUE)
stdfilt <- grep("std()", features, fixed = TRUE)
# the sort is required because union does not put things in order
filt <- sort(union(meanfilt, stdfilt)) 

# filter columns and column names, remove "()", and combine
X <- X[,filt]
features <- features[filt]
features <- sub("()", "", features, fixed = TRUE)
colnames(X) <- features

# merge y and subject into x
# compile activity labels for X from y and activity_labels
# don't do this in real life: readability horrible
activity <- activity_labels$V2[match(y$V1, activity_labels$V1)]
X <- cbind(subject, X)
X <- cbind(activity, X)

# now X contains all the means and standard deviations,
# the test subject numbers, and the activity the test subject is
# actually performing, which should be everything we need.
df <- X
