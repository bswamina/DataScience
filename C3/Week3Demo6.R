### Merge two data frames by common columns or row names

reviews <- read.csv("~/Downloads/reviews.csv")
solutions <- read.csv("~/Downloads/solutions.csv")

### By default the data frames are merged on the columns with names they
### both have, but separate specifications of the columns can be given
### by by.x and by.y
###
### Columns to merge on can be specified by name, number or by a logical
### vector: the name "row.names" or the number 0 specifies the row names.
### If specified by name it must correspond uniquely to a named column
### in the input

revsol <- merge(reviews, solutions, by.x = "solution_id", by.y = "id", all = T)
