
### Directory and file setup

directory <- "~/Downloads/pa3-data/"
outcome_file <- "outcome-of-care-measures.csv"
outcome_csv <- sprintf("%s/%s", directory, outcome_file)

### Read csv into a data frame

outcome_data <- read.csv(outcome_csv, colClasses = "character")

### Problem 1

head(outcome_data)
names(outcome_data)
outcome_data[, 11] <- as.numeric(outcome_data[, 11])
hist(outcome_data[, 11], main = "Death Rate from Heart Attack", xlab = "Death Rate")

### Setup for Problems 2, 3, and 4

outcome_data[, 17] <- as.numeric(outcome_data[, 17])
outcome_data[, 23] <- as.numeric(outcome_data[, 23])
