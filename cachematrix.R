## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { 
        m <-NULL
        setmatrix<- function(y){
                x<<- y
                m<<- NULL
        }
        getmatrix <- function() x
        setinversematrix <- function(solve) m <<- solve
        getinversematrix <- function() m
        list(setmatrix = setmatrix, getmatrix = getmatrix, 
             setinversematrix = setinversematrix,
             getinversematrix=getinversematrix)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) { m <-x$getinversematrix()
        if(!is.null(m)) {
                message("getting inverse of cached matrix")
                return(m)
        } 
        data <-x$getmatrix()
        m<- solve(data, ...)
        x$setinversematrix(m)
        ## Return a matrix that is the inverse of 'x'
}
