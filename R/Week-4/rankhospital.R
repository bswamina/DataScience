###
### Write a function called rankhospital that takes three arguments:
###
### 1. the 2-character abbreviated name of a state (state)
### 2. an outcome (outcome)
### 3. the ranking of a hospital in that state for that outcome (num)
###
### The function reads the outcome-of-care-measures.csv file and returns a
### character vector with the name of the hospital that has the ranking
### specified by the num argument. For example, the call
###
### rankhospital("MD", "heart failure", 5)
###
### would return a character vector containing the name of the hospital
### with the 5th lowest 30-day death rate for heart failure. The num
### argument can take values “best”, “worst”, or an integer indicating
### the ranking (smaller numbers are better). If the number given by num
### is larger than the number of hospitals in that state, then the function
### should return NA. Hospitals that do not have data on a particular
### outcome should be excluded from the set of hospitals when deciding the
### rankings.
### It may occur that multiple hospitals have the same 30-day mortality
### rate for a given cause of death. In those cases ties should be broken
### by using the hospital name.
###
### The function should check the validity of its arguments. If an invalid
### state value is passed to best, the function should throw an error via
### the stop function with the exact message “invalid state”. If an invalid
### outcome value is passed to best, the function should throw an error via
### the stop function with the exact message “invalid outcome”.
###

rankhospital <- function(state, outcome, num = "best") {
    ### First extract all the unique state names from column 7 of the dataframe
    
    valid_states <- unique(outcome_data[, 7])
    
    ### Check if the specified state is valid by checking for presence in
    ### valid_states
    
    if (!state %in% valid_states) {
        stop("Invalid state")
    }
    
    ### Vector of possible outcomes
    
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    
    ### Check if the specified outcome is valid by checking for presence in
    ### valid_outcomes
    
    if (!outcome %in% valid_outcomes) {
        stop("Invalid outcome")
    }
    
    ### Check if the specified num is valid by checking if value is "best",
    ### "worst", or a valid number
    
    best_worst <- c("best", "worst")
    if (!num %in% best_worst) {
        if (is.na(as.numeric(num))) {
            stop("invalid num")
        }
    }
    
    ### Determine the column index for the specified outcome
    
    column <- 11 ### Column for outcome = "heart attack"
    if (outcome == "heart failure") {
        column <- 17 ### Column for outcome = "heart failure"
    }
    else if (outcome == "pneumonia") {
        column <- 23 ### Column for outcome = "pneumonia"
    }
    
    ### Create a new dataframe with data for the specified state and the
    ### specified outcome. We make sure we have excluded rows with missing
    ### values for the outcome column
    
    state_data <- outcome_data[outcome_data[, 7] == state & 
                                   !is.na(outcome_data[, column]), ]
    
    ### Create a new dataframe with rows sorted by the best to the worst
    ### 30-day mortality plus the hopital name (column 2)
    
    final_data <- state_data[order(state_data[, column], state_data[, 2]), ]
    
    ### Add a new Rank column using the seq_along function
    
    final_data[["Rank"]] <- seq_along(final_data[, column])
    
    ### Determine the numeric value of num - if "best", 1st row. If "worst"
    ### last row, else the numeric value
    
    num_val <- 0 ### Numeric value for rank
    if (num == "best") {
        num_val <- 1
    }
    else if (num == "worst") {
        num_val <- nrow(final_data)
    }
    else {
        num_val <- as.numeric(num)
    }
    
    ### If the numeric value of num is greater than the no. of rows, return NA

    if (num_val > nrow(final_data)) {
        return(NA)
    }
    
    ### Return the hospital name (column 2) corresponding to the specified num
    
    final_data[num_val, 2]
}

###
### Test cases:
###
### 1. rankhospital("TX", "heart failure", 4)
### [1] "DETAR HOSPITAL NAVARRO"
###
### 2. rankhospital("MD", "heart attack", "worst")
### [1] "HARFORD MEMORIAL HOSPITAL"
###
### 3. rankhospital("MN", "heart attack", 5000)
### [1] NA
###