###
### Function to return a vector of correlations between sulfate & nitrate
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
        csv_file <- sprintf("%s/%03d.csv", directory, i)
        if (file.exists(csv_file)) {
            data <- read.csv(csv_file)
            
            ### Look for complete cases
            data_good <- na.omit(data)
            
            ### Find correlation if above threshold
            if (nrow(data_good) > threshold) {
                vec <- c(vec, cor(data_good[, 2], data_good[, 3]))
            }
        }
    }
    
    return(vec)
}