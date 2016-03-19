
###
### Initialize variables for use in this R script

file <- "../Data/wksst8110.for"

### Each line in the file looks like this:
###  03JAN1990     23.4-0.4     25.1-0.3     26.6 0.0     28.6 0.3
###
### A negative number is for skipping columns - so a -1 means skip
### one column (there is one space before every record so skip that)
### -5 mean skip 5 columns (5 spaces after every field)

widths <- c(-1, 9, -5, 4, 4, -5, 4, 4, -5, 4, 4, -5, 4, 4)

### Read the dataframe using the read.fwf function (we need to skip
### the first 4 lines)
df <- read.fwf(file = file, widths = widths, skip = 4)

### Print the first few rows of the data frame

head(df)

### Now sum all the elements along column 4

print (sum(df[, 4]))

### This should print the following:
### [1] 32426.7
