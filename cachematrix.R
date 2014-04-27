## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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


## Write a short comment describing this function

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
