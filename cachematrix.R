## Below are two functions that are used to create a special object that stores a matrix and cache's its inverse.


## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
##set the value of the matrix
##get the value of the matrix
##set the value of the inverse
##get the value of the inverse

makeCacheMatrix <- function(x = matrix()) { 
        m <-NULL
        set<- function(y){
                x<<- y
                m<<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get, 
             setinverse = setinverse,
             getinverse=getinverse)
        
}


## The following function calculates the inverse of the matrix created with the makeCacheMatrix function. 
## It first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache 
##and skips the computation.Otherwise, it calculates the inverse of the matrix 
##and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) { 
        m <-x$getinverse()
        ## Return a matrix that is the inverse of 'x'
        if(!is.null(m)) {
                message("getting inverse of cached matrix")
                return(m)
        } 
        data <-x$get()
        m<- solve(data, ...)
        x$setinverse(m)
        m                         
}

