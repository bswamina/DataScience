###
### Function to compute the mean for a given pollutant (sulfate or nitrate)
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

    ### Initial sum and count
    total_sum <- 0
    total_count <- 0
    
    ### Loop through all the specified id
    for (i in id) {
        csv_file <- sprintf("%s/%03d.csv", directory, i)
        if (file.exists(csv_file)) {
            data <- read.csv(csv_file)
            
            pvec <- data[[pollutant]]
            
            ### Remove NA values
            pvec_good <- na.omit(pvec)

            ### Accumulate sum and length
            total_sum <- total_sum + sum(pvec_good)
            total_count <- total_count + length(pvec_good)
        }
    }

    return(round(total_sum/total_count, 3))
}