###
### Write a function called best that take two arguments:
###
### 1. the 2-character abbreviated name of a state
### 2. outcome name
###
### The function reads the outcome-of-care-measures.csv file and returns
### a character vector with the name of the hospital that has the best
### (i.e. lowest) 30-day mortality for the specified outcome in that state.
###
### The hospital name is the name provided in the Hospital.Name variable.
### The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”.
###
### Hospitals that do not have data on a particular outcome should be excluded
### from the set of hospitals when deciding the rankings.
###
### If there is a tie for the best hospital for a given outcome, then the
### hospital names should be sorted in alphabetical order and the first
### hospital in that set should be chosen (i.e. if hospitals “b”, “c”, and “f”
### are tied for best, then hospital “b” should be returned).
###
### The function should check the validity of its arguments. If an invalid
### state value is passed to best, the function should throw an error via the
### stop function with the exact message “invalid state”. If an invalid
### outcome value is passed to best, the function should throw an error via
### the stop function with the exact message “invalid outcome”.
###

best <- function(state, outcome) {
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

    ### Find lowest 30-day mortality for the specified outcome column
    
    min_value <- min(state_data[, column])
    
    ### Create a new dataframe with rows containing the lowest 30-day mortality

    final_data <- state_data[state_data[, column] == min_value, ]
    
    ### Sort by the hospital name (column 2) in case there are more than one row
    
    final_data <- final_data[order(final_data[, 2]), ]
    
    ### Return the hospital name with the lowest 30-day mortality for an outcome

    final_data[1, 2]
}

###
### Test cases:
###
### 1. best("TX", "heart attack")
### [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
###
### 2. best("TX", "heart failure")
### [1] "FORT DUNCAN MEDICAL CENTER"
###
### 3. best("MD", "heart attack")
### [1] "JOHNS HOPKINS HOSPITAL, THE"
###
### 4. best("MD", "pneumonia")
### [1] "GREATER BALTIMORE MEDICAL CENTER"
###
### 5. best("BB", "heart attack")
### Error in best("BB", "heart attack") : invalid state
###
### 6. best("NY", "hert attack")
### Error in best("NY", "hert attack") : invalid outcome
###