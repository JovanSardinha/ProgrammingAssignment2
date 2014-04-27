source("cachematrix.R")

a <- makeCacheMatrix(matrix(1:4,2))
a$get()
a$getInverse()
a$set(matrix(5:8,2))
a$get()
cacheSolve(a)
cacheSolve(a)
a$getInverse()
#test inverse correctness
b = a$getInverse()
a$get() %*% b           #this matrix multiplication should show identity matrix