setwd("~/datascience/getdata/cp")

# prepare data cache
if(!exists("X_test_cache")) {
  X_test_cache <- read.table("dataset/test/X_test.txt",
                             colClasses = "numeric")
}

if(!exists("y_test_cache")) {
  y_test_cache <- read.table("dataset/test/y_test.txt")
}

if(!exists("X_train_cache")) {
  X_train_cache <- read.table("dataset/train/X_train.txt",
                              colClasses = "numeric")
}
if(!exists("y_train_cache")) {
  y_train_cache <- read.table("dataset/train/y_train.txt")
}
if(!exists("features_cache")) {
  features_cache <- read.table("dataset/features.txt")
}
if(!exists("activity_labels_cache")) {
  activity_labels_cache <- read.table("dataset/activity_labels.txt")
}

# read from cache the data to actually operate on
X_test <- X_test_cache
y_test <- y_test_cache
X_train <- X_train_cache
y_train <- y_train_cache
features <- features_cache
activity_labels <- activity_labels_cache

#merge test and train data