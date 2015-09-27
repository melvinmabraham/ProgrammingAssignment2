## Functions below cache the inverse of a matrix if it doesn't exist already.
## We assume that the matrix supplied for this is always invertible.

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        cache <- NULL
        
        setMatrix <- function(newValue) {
                x <<- newValue
                cache <<- NULL
        }
        
        getMatrix <- function() {
                x
        }
        
        cacheInverse <- funciton(solve) {
                cache <<- solve
        }
        
        getInverse <- function() {
                cache
        }
        
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        inverse <- x$getInverse()
        
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        
        inverse
}
