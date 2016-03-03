###
### Write a function that takes a directory of data files and a threshold for
### complete cases and calculates the correlation between sulfate and nitrate
### for monitor locations where the number of completely observed cases (on
### all variables) is greater than the threshold. The function should return
### a vector of correlations for the monitors that meet the threshold requirement.
### If no monitors meet the threshold requirement, then the function should return
### a numeric vector of length 0.
###
### Test cases:
###
### 1. cr <- corr("specdata", 150)
###    head(cr)
###
###    Expected result: -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
###
### 2. summary(cr)
###
###    Expected result:    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
###                     -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
###
### 3. cr <- corr("specdata", 400)
###    head(cr)
###
###    Expected result: -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
###
### 4. summary(cr)
###
###    Expected result:    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
###                     -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
###
### 5. cr <- corr("specdata", 5000)
###    summary(cr)
###
###    Expected result:    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
###
### 6. length(cr)
###
###    Expected result:    0
###
### 7. cr <- corr("specdata")
###    summary(cr)
###
###    Expected result:    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
###                     -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
###
### 8. length(cr)
###
###    Expected result:    323
###
corr <- function(directory, threshold = 0) {
    ### Check if the specified directory exists
    if (!dir.exists(directory)) {
        cat("Error: Specified directory", directory, "does not exist !!!\n")
        return(NA)
    }
    
    ### Create an null vector
    vec <- NULL 
    
    ### Loop through all the specified id
    for (i in 1:332) {
        ### Get the full file name
        csv_file <- sprintf("%s/%03d.csv", directory, i)
        
        ### Check if the file exists
        if (file.exists(csv_file)) {
            ### Read the file into a data frame
            data <- read.csv(csv_file)
            
            ### Look for complete cases by removing rows with NAs
            data_good <- na.omit(data)
            
            ### Find correlation if above threshold
            if (nrow(data_good) > threshold) {
                vec <- c(vec, round(cor(data_good[, 2], data_good[, 3])), 5)
            }
        }
    }
    
    return(vec)
}