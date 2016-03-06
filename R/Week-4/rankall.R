###
### Write a function called rankall that takes two arguments:
###
### 1.an outcome name (outcome)
### 2. a hospital ranking (num)
###
### The function reads the outcome-of-care-measures.csv file and returns
### a 2-column data frame containing the hospital in each state that has
### the ranking specified in num. For example the function call
###
### rankall("heart attack", "best")
###
### would return a data frame containing the names of the hospitals that
### are the best in their respective states for 30-day heart attack death
### rates. The function should return a value for every state (some may
### be NA). The first column in the data frame is named hospital, which
### contains the hospital name, and the second column is named state,
### which contains the 2-character abbreviation for the state name.
### Hospitals that do not have data on a particular outcome should be
### excluded from the set of hospitals when deciding the rankings.
###
### The rankall function should handle ties in the 30-day mortality rates
### in the same way that the rankhospital function handles ties.
###
### The function should check the validity of its arguments. If an
### invalid outcome value is passed to rankall, the function should
### throw an error via the stop function with the exact message
### “invalid outcome”. The num variable can take values “best”, “worst”,
### or an integer indicating the ranking (smaller numbers are better).
### If the number given by num is larger than the number of hospitals in
### that state, then the function should return NA.
###

rankall <- function(outcome, num = "best") {
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
    
    ### Extract and sort all the unique state names from column 7 of the
    ### dataframe
    
    all_states <- sort(unique(outcome_data[, 7]))
    
    ### Create an empty dataframe to collect a row for each hospital and state
    ### The arg stringsAsFactors = FALSE is very important !!!
    
    final_data <- data.frame(hospital = character(), state = character(), 
                             stringsAsFactors = FALSE)
    
    ### Determine the column index for the specified outcome
    
    column <- 11 ### Column for outcome = "heart attack"
    if (outcome == "heart failure") {
        column <- 17 ### Column for outcome = "heart failure"
    }
    else if (outcome == "pneumonia") {
        column <- 23 ### Column for outcome = "pneumonia"
    }

    ### Looping over each state, we will find the hospital with the specified
    ### ranking and add it to the dataframe final_data
    
    for (state in all_states) {
        ### Create a new dataframe with data for the specified state and the
        ### specified outcome. We make sure we have excluded rows with missing
        ### values for the outcome column
        
        state_data <- outcome_data[outcome_data[, 7] == state & 
                                       !is.na(outcome_data[, column]), ]

        ### Create a new dataframe with rows sorted by the best to the worst
        ### 30-day mortality plus the hopital name (column 2)
        
        rank_data <- state_data[order(state_data[, column], state_data[, 2]), ]
        
        ### Add a new Rank column using the seq_along function
        
        rank_data[["Rank"]] <- seq_along(rank_data[, column])
        
        ### Determine the numeric value of num - if "best", 1st row. If "worst"
        ### last row, else the numeric value
        
        num_val <- 0 ### Numeric value for rank
        if (num == "best") {
            num_val <- 1
        }
        else if (num == "worst") {
            num_val <- nrow(rank_data)
        }
        else {
            num_val <- as.numeric(num)
        }
        
        ### If the numeric value of num is greater than the no. of rows, return
        ### NA. Else, return the hospital name (column 2) corresponding to
        ### the specified num
        
        hospital <- if (num_val > nrow(rank_data)) {
            NA
        }
        else {
            rank_data[num_val, 2]
        }
        
        ### Add a new row to the final_data dataframe

        final_data[nrow(final_data)+1, ] <- c(hospital, state)
    }
    
    ### Adjust the row names to match the state names
    
    row.names(final_data) <- all_states
    
    ### Return the final result - a 2 column dataframe
    
    final_data
}

###
### Test cases:
###
### 1. head(rankall("heart attack", 20), 10)
###                               hospital state
### AK                                <NA>    AK
### AL      D W MCMILLAN MEMORIAL HOSPITAL    AL
### AR   ARKANSAS METHODIST MEDICAL CENTER    AR
### AZ JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ
### CA               SHERMAN OAKS HOSPITAL    CA
### CO            SKY RIDGE MEDICAL CENTER    CO
### CT             MIDSTATE MEDICAL CENTER    CT
### DC                                <NA>    DC
### DE                                <NA>    DE
### FL      SOUTH FLORIDA BAPTIST HOSPITAL    FL
###
### 2. tail(rankall("pneumonia", "worst"), 3)
###                                      hospital state
### WI MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC    WI
### WV                     PLATEAU MEDICAL CENTER    WV
### WY           NORTH BIG HORN HOSPITAL DISTRICT    WY
###
### 3. tail(rankall("heart failure"), 10)
###                                                             hospital state
### TN                         WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL    TN
### TX                                        FORT DUNCAN MEDICAL CENTER    TX
### UT VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER    UT
### VA                                          SENTARA POTOMAC HOSPITAL    VA
### VI                            GOV JUAN F LUIS HOSPITAL & MEDICAL CTR    VI
### VT                                              SPRINGFIELD HOSPITAL    VT
### WA                                         HARBORVIEW MEDICAL CENTER    WA
### WI                                    AURORA ST LUKES MEDICAL CENTER    WI
### WV                                         FAIRMONT GENERAL HOSPITAL    WV
### WY                                        CHEYENNE VA MEDICAL CENTER    WY
###