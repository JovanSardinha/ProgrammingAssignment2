# File Name: testCases.R
# Written By: Jovan Sardinha
# Created On: April 26, 2014
# Email: jovan.sardinha@gmail.com
# Operating System: Windows 7 (32 bit)

source("cachematrix.R")

a <- makeCacheMatrix(matrix(1:4,2))
b <- matrix(0:3,2) 

# Testing get() and set() fucntionality
a$get()
a$set(b)
a$get(b)

# Testing inverse functionality
a$getInverse()
a$set(matrix(5:8,2))
a$get()

# Testing if inverse is calculated if cached inverse exists
cacheSolve(a)
cacheSolve(a)
a$getInverse()

# Testing inverse correctness
b = a$getInverse()

# This matrix multiplication should show identity matrix
# Reason: a matrix x %*% inv(x) = I ; where I = identity matrix
a$get() %*% b           