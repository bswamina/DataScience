###
### Function to return a data frame of files and count of complete cases
###
complete <- function(directory, id = 1:332) {
    ### Check if the specified directory exists
    if (!dir.exists(directory)) {
        cat("Error: Specified directory", directory, "does not exist !!!\n")
        return(NA)
    }

    ### Create an empty data frame
    df <- data.frame(id = numeric(), nobs = numeric())    
    
    ### Loop through all the specified id
    for (i in id) {
        csv_file <- sprintf("%s/%03d.csv", directory, i)
        if (file.exists(csv_file)) {
            data <- read.csv(csv_file)
            
            ### Look for complete cases
            data_good <- na.omit(data)
            
            ### Add a row in the data frame df with the id and count
            df[nrow(df)+1, ] <- c(i, nrow(data_good))
        }
    }
    
    return(df)
}