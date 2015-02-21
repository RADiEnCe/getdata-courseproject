# How The Script Works
1. It checks the existance of cache variables (`X_test_cache` and `X_train_cache`) for the biggest two files in the dataset, `X_test.txt` and `X_train.txt`. If they aren't, they are read from the folder `dataset` under the working directory.
2. It then makes a variable for all the needed files, reading them in one by one. For `X_train` and `X_test`, however, it copies in the content from the cache variables instead.
3. It merges the test and train datasets for the variables X, y, and subject
4. With `grep()` and `union()`, it constructs a filter to restrict X to columns that contain the strings `std()` or `mean()`.
5. `y` and `subject` are then merged into X, which is written into the file

# The Columns from the Tidy File
##Variables from X_train.txt and X_test.txt:
For descriptions of these, consult _features_info.txt_ and _features.txt_, under the directory _dataset_ in this github repository.

Only variables whose names in features.txt contain "mean()" "std()" are included in the outputted data file.

And......

__WHAT THE HELL IS AN EUCLIDEAN NORM!?!?__

__FFT?__

__Corner frequency??__

I thought that a professional math background wasn't required for this specialization!

Well, I sort-of gave you the units and the variable descriptions, so yay, job well don.

~~I'm just fooling myself, aren't I?~~

## Othervariables
_subject_: a number indicating which subject the data is gathered from

_activity_: indicates which activity the subject is doing at the time of measurements. I would consider the names pretty obvioius.