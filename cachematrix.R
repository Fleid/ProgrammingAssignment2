## Put comments here that give an overall description of what your
## functions do

## Expose les 4 fonctions qui g�rent la mise en cache (get,set,setmean,getmean)
makeCacheMatrix <- function(x = matrix()) {

  ## Initialisation
  m <- NULL
  ## Fonctions : on manipule des paires clefs/valeurs avec le r�sultat, stock�es dans l'env de la fonction
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  
  ## On retourne la liste des fonctions
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}


## G�re effectivement la mise en cache � partir des 4 fonctions mises � dispo
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  ## On va chercher la valeur d�j� stock�e
  ## Si elle existe d�j�, on a d�j� fait le calcul: on retourne la valeur stock�e
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  ## Sinon on va chercher la valeur...
  data <- x$get()
  ## ...et avec solve on calcule l'inverse de la matrice
  m <- solve(data, ...)
  ## On l'enregistre et on la retourne
  x$setmean(m)
  m
}


