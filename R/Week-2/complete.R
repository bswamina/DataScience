###
### Write a function that reads a directory full of files and reports the number
### of completely observed cases in each data file. The function should return a
### data frame where the first column is the name of the file and the second
### column is the number of complete cases.
###
### Test cases:
###
### 1. complete("specdata", 1)
###
###    Expected result: id nobs
###                      1  117
###
### 2. complete("specdata", c(2, 4, 8, 10, 12))
###
###    Expected result: id nobs
###                      2 1041
###                      4  474
###                      8  192
###                     10  148
###                     12   96
###
### 3. complete("specdata", 30:25)
###
###    Expected result: id nobs
###                     30  932
###                     29  711
###                     28  475
###                     27  338
###                     26  586
###                     25  463
###
### 4. complete("specdata", 3)
###
###    Expected result: id nobs
###                      3  243
###
complete <- function(directory, id = 1:332) {
    ### Check if the specified directory exists
    if (!dir.exists(directory)) {
        cat("Error: Specified directory", directory, "does not exist !!!\n")
        return(NA)
    }

    ### Create an empty data frame to collect the results
    df <- data.frame(id = numeric(), nobs = numeric())    
    
    ### Loop through all the specified id
    for (i in id) {
        ### Get the full file name
        csv_file <- sprintf("%s/%03d.csv", directory, i)
        
        ### Check if the file exists
        if (file.exists(csv_file)) {
            ### Read the file into a data frame
            data <- read.csv(csv_file)
            
            ### Look for complete cases by eliminating rows with NA
            data_good <- na.omit(data)
            
            ### Add a row in the data frame df with the id and count
            df[nrow(df)+1, ] <- c(i, nrow(data_good))
        }
    }
    
    return(df)
}