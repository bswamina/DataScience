###
### Write a function named 'pollutantmean' that calculates the mean of a pollutant
### (sulfate or nitrate) across a specified list of monitors.
###
### The function 'pollutantmean' takes three arguments: 'directory', 'pollutant',
### and 'id'.
###
### Given a vector monitor ID numbers, 'pollutantmean' reads that monitors'
### particulate matter data from the directory specified in the 'directory'
### argument and returns the mean of the pollutant across all of the monitors,
### ignoring any missing values coded as NA.
###
### Test cases:
###
### 1. pollutantmean("specdata", "sulfate", 1:10)
###
###    Expected result: 4.064
###
### 2. pollutantmean("specdata", "nitrate", 70:72)
###
###    Expected result: 1.706
###
### 3. pollutantmean("specdata", "nitrate", 23)
###
###    Expected result: 1.281
###
pollutantmean <- function(directory, pollutant, id = 1:332) {
    ### Check if the specified directory exists
    if (!dir.exists(directory)) {
        cat("Error: Specified directory", directory, "does not exist !!!\n")
        return(NA)
    }
    
    ### Check if the specified pollutant is either sulfate or nitrate
    if (!pollutant %in% c("sulfate", "nitrate")) {
        cat("Error: Specified pollutant", pollutant, "not not match sulfate or nitrate !!!\n")
        return(NA)
    }

    ### Initialize the aggretating variables sum and count to zero
    total_sum <- 0
    total_count <- 0
    
    ### Loop through all the specified id
    for (i in id) {
        ### Get the full file name
        csv_file <- sprintf("%s/%03d.csv", directory, i)
        
        ### Check if the file exists
        if (file.exists(csv_file)) {
            ### Read the file into a data frame
            data <- read.csv(csv_file)
            
            ### Extract the pollutant column into a vector
            pvec <- data[[pollutant]]
            
            ### Remove NA values from the pollutant vector
            pvec_good <- na.omit(pvec)

            ### Accumulate sum and length
            total_sum <- total_sum + sum(pvec_good)
            total_count <- total_count + length(pvec_good)
        }
    }

    return(round(total_sum/total_count, 3))
}