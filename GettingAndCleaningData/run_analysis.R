### Load the dplyr library

library(dplyr)

### Initialize global variable(s)

wd <- getwd()
dataset.dir <- paste0(wd, "/UCI HAR Dataset")
labels.file <- paste0(dataset.dir, "/activity_labels.txt")
features.file <- paste0(dataset.dir, "/features.txt")
test.subject.file <- paste0(dataset.dir, "/test/subject_test.txt")
test.label.file <- paste0(dataset.dir, "/test/y_test.txt")
test.data.file <- paste0(dataset.dir, "/test/X_test.txt")
train.subject.file <- paste0(dataset.dir, "/train/subject_train.txt")
train.label.file <- paste0(dataset.dir, "/train/y_train.txt")
train.data.file <- paste0(dataset.dir, "/train/X_train.txt")
final.merged.file <- paste0(wd, "/final_merged.txt")
final.summary.file <- paste0(wd, "/final_summary.txt")

### Load the activity labels

print(paste("Loading the file", labels.file, "..."))
activity.labels <- read.table(labels.file, 
                              stringsAsFactors = FALSE,
                              col.names = c("aid", "activity"))

### Load the feature labels

print(paste("Loading the file", features.file, "..."))
feature.labels <- read.table(features.file, 
                              stringsAsFactors = FALSE,
                              col.names = c("fid", "feature"))
features <- feature.labels[, 2]
rm(feature.labels)

### Process the test dataset

print(paste("Loading the file", test.subject.file, "..."))
test.subjects <- read.table(test.subject.file,
                            col.names = c("subject"))

print(paste("Loading the file", test.label.file, "..."))
test.labels <- read.table(test.label.file,
                          col.names = c("aid"))

print(paste("Loading the file", test.data.file, "..."))
test.data <- read.table(test.data.file,
                        col.names = features,
                        check.names = FALSE)

print("Creating the test dataset...")
test.set <- cbind(test.subjects, test.labels, test.data)
rm(test.subjects, test.labels, test.data)
print("Done creating the test dataset.")

### Process the train dataset

print(paste("Loading the file", train.subject.file, "..."))
train.subjects <- read.table(train.subject.file,
                             col.names = c("subject"))

print(paste("Loading the file", train.label.file, "..."))
train.labels <- read.table(train.label.file,
                           col.names = c("aid"))

print(paste("Loading the file", train.data.file, "..."))
train.data <- read.table(train.data.file,
                         col.names = features,
                         check.names = FALSE)

print("Creating the train dataset...")
train.set <- cbind(train.subjects, train.labels, train.data)
rm(train.subjects, train.labels, train.data)
print("Done creating the train dataset.")

### Combine the test and train datasets and merge activity labels

print("Creating the full merged dataset...")
full.set <- rbind(train.set, test.set)
full.set <- merge(activity.labels, full.set)
rm(activity.labels, features, test.set, train.set)
print("Done creating the full merged dataset.")

### Select features that are mean & standard deviation measurements

print("Selecting the mean & std measurements from the full merged dataset...")
col.names <- names(full.set)
mean.std.indices <- grep(col.names, pattern = "-(mean|std)\\(\\)")
req.indices <- c(3, 2, mean.std.indices)
rm(col.names, mean.std.indices)

### Prepare the final desired dataset

print("Preparing a final dataset with subject, activity, the mean & std measurements...")
final.set <- full.set %>% 
    select(req.indices) %>% 
    arrange(subject)

print("Preparing to clean the column names for the final dataset...")
fs.col.names <- names(final.set)
fs.col.names <- gsub(pattern = "-mean\\(\\)", replacement = "Mean", fs.col.names)
fs.col.names <- gsub(pattern = "-std\\(\\)", replacement = "Std", fs.col.names)
fs.col.names <- gsub(pattern = "-", replacement = ".", fs.col.names)
names(final.set) <- fs.col.names
rm(fs.col.names, req.indices, full.set)

print(paste("Preparing to write the final merged dataset file", final.merged.file, "..."))
write.table(final.set, final.merged.file, row.names = FALSE)
print("Done writing the file final_merged.txt !!!")
print(paste0(paste("Done writing file", final.merged.file), "."))

### Prepare the summary dataset group by subject and activity

print("Preparing the dataset with mean values grouped by subject/activity...")
summary.set <- final.set %>% 
    group_by(subject, activity) %>% 
    summarise_each(funs(round(mean(.), 5)))

print("Preparing to clean the column names for summary dataset...")
sum.col.names <- names(summary.set)
sum.col.names <- sapply(sum.col.names, function(name) {
        if (name != "subject" && name != "activity") { 
            paste0(name, ".Avg")
        } else { 
            name 
        }
    }, 
    USE.NAMES = F)
names(summary.set) <- sum.col.names
rm(sum.col.names)

print(paste("Preparing to write the final summary dataset file", final.summary.file, "..."))
write.table(summary.set, final.summary.file, row.names = FALSE)
print(paste0(paste("Done writing file", final.summary.file), "."))

### Final clean up

rm(list = ls())
print("SUCCESS !!!")
