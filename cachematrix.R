## create script for cal inversion matrix
## 

## 

makeCacheMatrix <- function(x = matrix()) {
        im <-NULL
        set <-function(y){
                x <<- y
                im <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) im <<- inverse
        getinverse <- function () im
        list ( set = set, get = get,
                setinverse = setinverse,
                getinverse = getinverse)
        
}

cacheSolve <- function (x,...){
        im <- x$getinverse()
        if(!is.null(im)) {
                message("getting cache data")
                return(im)
        }
        data <- x$get()
        im <- solve(data,...)
        x$setinverse(im)
        im
}

