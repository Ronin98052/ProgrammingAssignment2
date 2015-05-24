## The application consists of two functions

## makeCacheMatrix
##
## 1. sets the value of the matrix as in the x environment and sets any existing
##    inverse in x to null. 
## 2. acts as a function factory for the set, get, setmatrix and getmatrix functions. 
##    - set() - sets the input matrix in a static environment named x (cache) between calls
##    - get() - gets the value of a previously stored matrix
##    - setmatrix() uses R solve() to create a copy of solve() in the cache.
##    - getmatrix() returns the matrix inverse (variable m) from the cache.
## 3. list() is not required, so is commented out, but retained for documentation purposes. 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(solve) m <<- solve
  ## list(set = set, get = get,
  ##    setmean = setmean,
  ##    getmean = getmean)
}

## cacheSolve

## If the inverse was previously calculated (!is.null), returns it. 
## else gets the original matrix from x, invokes solve() to calculate the inverse,
## and stores the new inverse in the cache using functions defined in makeCacheMatrix
## and returns it to the console.

cacheSolve <- function(x=matrix()) {
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  matrix <- x$get()
  m <- solve(x)
  x$setmatrix(m)
  m
}
