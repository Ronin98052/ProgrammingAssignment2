## The application consists of two functions

## makeCacheMatrix
##
## 1. sets the value of the matrix as in the x environment and sets any existing
##    inverse in x to null. 
## 2. acts as a function factory for the set, get, setmatrix and getmatrix functions. 
##    - set() - sets the input matrix in cache between calls
##    - get() - gets the value of a cached matrix
##    - setmatrix() uses R solve() to create a copy of solve() in the cache.
##    - getmatrix() returns the inverse (variable m) from the cache.
##
## NOTE: data mat = matrix, inv = matrix inverse in cache

makeCacheMatrix <- function(mat = matrix()) {
  inv <- NULL
  set <- function(mat) {
    x <<- mat             ## Store matrix in cache
    inv <<- NULL          ## Set cache inverse to empty
  }
  get <- function() mat   
  setInverse <- function() inv <<- solve(x) ## calc and store in cache
  getInverse <- function inv                ## get from cache
  list(set = set, get = get,
  setInverse = setInverse,
  getInverse = getInverse)
}

## cacheSolve

## If the inverse was previously calculated (!is.null), returns it. 
## else gets the original matrix from x, invokes solve() to calculate the inverse,
## and stores the new inverse in the cache using functions defined in makeCacheMatrix
## and returns it.

cacheSolve <- function(mat=matrix()) {
  gInv <- x$getinverse()  ## get inv from cache
  if(!is.null(gInv)) {
    message("getting cached data")
    return(gInv)          ## if exists in cache, return it and exit
  }
  mat <- x$get()          ## get matrix from cache
  inv <- solve(matrix)    ## calc matrix global env inv
  x$setmatrix(gInv)       ## set cache to global env
  gInv                    ## return global env
}
