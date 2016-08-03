
### 1. Which of the following items is required for an R package to pass R CMD check without
### any warnings or errors?

### DESCRIPTION file OR An explicit software license

### 2. Which of the following is a generic function in a fresh installation of R, with only
### the default packages loaded?

### show, mean, predict

### 3. What function is used to obtain the function body for an S4 method function?

### getMethod()

### 4. Please download the R package DDPQuiz3 from the course web site. Examine the
### createmean function implemented in the R/ sub-directory. What is the appropriate
### text to place above the createmean function for Roxygen2 to create a complete help file?

#' This function calculates the mean
#' 
#' @param x is a numeric vector
#' @return the mean of x
#' @export
#' @examples 
#' x <- 1:10
#' createmean(x)
