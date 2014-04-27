# File Name: cachematrix.R
# Written By: Jovan Sardinha
# Created On: April 26, 2014
# Email: jovan.sardinha@gmail.com
# Operating System: Windows 7 (32 bit)


## The function makeCacheMatrix takes a matrix x (assumed to be 
## invertible).With this function one can get the previously 
## provided matrix x with the $get(), set a new value of the x
## matrix with $set(), get the matrix inverse of x, if it exists,
## with $getInverse() and set a new matrix inverse for x with 
## $setInverse().
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


## The function cacheSolve calculates the inverse of 
## the matrix x, if a cached inverse of this matrix 
## does not already exist. This function also assumes 
## that the matrix x is always invertible (no special
## built in error handeling for this).
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
