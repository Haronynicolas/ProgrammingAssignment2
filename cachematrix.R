## The makeCacheMatrix function creates a special "matrix" object that can cache its inverse.

## The makeCacheMatrix function creates a special "matrix", which is a list containing function to 
## 1. set the value of the matrix
## 2. get teh value of teh matrix
## 3. set the value of the matrix inverse
## 4. get the value of the matrix inverse 


makeCacheMatrix <- function(x=matrix()) {
        m <- NULL
        set <- function (y) {
                x <<- y
                m <<- NULL
        }

        get <- function() x 
        setmatrix <- function(solve) m <<- solve
        getmatrix <- function() m
        list(set = set, get = get,
             setmatrix=setmatrix,
             getmatrix=getmatrix)

}

## The cacheSolve function coputes the inverse of the special "matrix" returned by make CacheMatrix.
## If the inverse has already been calculated, and the matrix has not chnaged, then the cachesolve 
## retrieves the inverse from the cache 
        
cacheSolve <- function(x=matrix(), ...) {
        m<-x$getmatrix()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        matrix<-x$get()
        m<-solve(matrix, ...)
        x$setmatrix(m)
       
## Return a matrix that is the inverse of 'x'
        
        m
}

        

