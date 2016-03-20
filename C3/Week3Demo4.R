library(reshape2)

mtcars$carname <- rownames(mtcars)

### Takes data in a wide format and melts it into a long format.
### We need to tell melt which of the variables are id variables,
### and which are measured variables. If we only supply one of id.vars
### and measure.vars, melt will assume the remainder of the variables
### in the data set belong to the other. If we supply neither, melt
### will assume factor and character variables are id variables, and
### all others are measured

carmelt <- melt(mtcars, id = c('carname', 'cyl', 'mpg'), 
                measure.vars = c('gear', 'hp'))

head(carmelt)
tail(carmelt)

### Takes data in a long format and cast it into a wide format.
### The column names on the left of ~ are id columns and the ones
### on the right are the measured columns. For more than one collumns
### on the left or right of ~, use +

dcast(carmelt, cyl ~ variable, length)
dcast(carmelt, cyl ~ variable, mean)

### split divides the data in the vector x into the groups defined by f
### Usage: split(x, f, drop = FALSE, ...)

mysplit <- split(carmelt$cyl, carmelt$variable)

mylist <- lapply(mysplit, sum)

unlist(mylist)

### Same as unlist(lapply(mysplit, sum))

sapply(mysplit, sum)

### Split-apply-combine with ddply

# Summarize a dataset by two variables
dfx <- data.frame(
    group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
    sex = sample(c("M", "F"), size = 29, replace = TRUE),
    age = runif(n = 29, min = 18, max = 54)
)

# Note the use of the '.' function to allow
# group and sex to be used without quoting
ddply(dfx, .(group, sex), summarize,
      mean = round(mean(age), 2),
      sd = round(sd(age), 2))
