## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix takes a matrix x (assumed to be invertible).
## This function provides the capability to get the 
## matrix x previously provided with the get(), set a new 
## matrix with set(), get the matrix inverse, if it exists,
## with getInverse() and set a new matrix inverse with 
## setInverse().
makeCacheMatrix <- function(x = matrix()) {
     invX <- NULL
     set <- function(y) {
          x <<- y
          invX <<- NULL
     }
     
     get <- function() x
     setInverse<- function(inverse) invX <<- inverse
     getInverse <- function() invX
     list(set = set, get = get,
          setInverse = setInverse,
          getInverse = getInverse)
}


## The fucntion cacheSolve calculates the inverse of 
## the matrix x if a cached inverse of this matrix 
## does not already exist. This function also assumed 
## that the matrix x is always invertible (no built-int
## error handeling for this case).
cacheSolve <- function(x, ...) {
     invX <- x$getInverse()
     if (!is.null(invX)) {
          message("getting cached inverse matrix")
          return(invX)
     } 
          invX <- solve(x$get())
          x$setInverse(invX)
          return(invX)
}
