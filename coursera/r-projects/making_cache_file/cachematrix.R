## There are two functions in this script.
## The user needs to run the first function and saves it in a variable: e.g. result<-makeCacheMatrix("plug the desirable matrix here")
## Then the user needs to run the next function by cacheSolve(Result)


## The makeCacheMatrix is a function that does the following:
## 1. Sets the square matrix
## 2. Gets the square matrix
## 3. Sets the inverse of the matrix
## 4. Gets the inverse value
## functions do

makeCacheMatrix <- function(x = matrix()) {
     m<-NULL  
     set<-function(y){
       x<<-y
       m<<-NULL
     }
     
     
get<-function() x
setinverse<-function(inversed) m<<-inversed
getinverse<-function() m
list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  
  m<-x$getinverse()  ## this section checks if the matrix inverse exists in the cache"  
  if (!is.null(m)) {
    message ("getting the inverse from cached data")
    return (m)
  }
  
  data<-x$get()   ## this section is run when chache can not found in the first section
  m<-solve(data,...)  ## Creates the inverse matrix
  x$setinverse(m)      ## Stores the inverse in the cache
  m                   ## prints the inverse
  
}



