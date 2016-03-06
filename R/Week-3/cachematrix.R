###
### Matrix inversion is usually a costly computation and it may be
### beneficial to cache the inverse of a matrix rather than compute
### it each time
###
### Computing the inverse of a square matrix can be done with the
### solve function in R.
###

### This function creates a special "matrix" object that can cache
### its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    
    ### Set the value of the square matrix
    
    ### Notice the use of the <<- assignment operator that leverages
    ### scoping rules to set the value of the matrix in the parent
    ### environment (global) for this case
    
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    ### Get the value of the square matrix
    
    get <- function() x
    
    ### Cache the inverse of the square matrix
    
    setsolve <- function(solve) inv <<- solve
    
    ### Get the cached version of the inverse of the square matrix
    
    getsolve <- function() inv
    
    list(set = set,
         get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}

### This function computes the inverse of the special "matrix" returned by
### makeCacheMatrix above. If the inverse has already been calculated (and
### the matrix has not changed), then the cachesolve should retrieve the
### inverse from the cache.

cacheSolve <- function(x, ...) {
    inv <- x$getsolve()
    
    ### Is the return from getsolve function not null ? If it is not null,
    ### we have successfully retrieved the cached value computed previously
    
    if (!is.null(inv)) {
        message("Getting the cached version of the inverse of matrix")
        return(inv)
    }
    
    ### The getsolve function returned a null, so we need to compute the
    ### inverse of the matrix by calling the solve method and caching the
    ### results for future use
    
    mat <- x$get()
    
    inv <- solve(mat)
    
    x$setsolve(inv)
    
    inv
}

###
### Testcase:
###
### m <- matrix(c(3,1,2,1), 2, 2)
###
### m
###
###      [,1] [,2]
### [1,]    3    2
### [2,]    1    1
###
### sm <- makeCacheMatrix(m)
### 
### im <- cacheSolve(sm)
###
### im
###
###      [,1] [,2]
### [1,]    1   -2
### [2,]   -1    3
###
### im <- cacheSolve(sm)
### Getting the cached version of the inverse of matrix
###
