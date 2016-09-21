#' blake2b
#' 
#' A 512-bit blake2b hash implementation.
#' 
#' @param x
#' Input to be hashed. Can be a single string or a raw vector.
#' @param key
#' An optional key. Should be \code{NULL} (for no key), a single string, or a
#' raw vector.
#' 
#' @return
#' The hash of the string as a raw vector.
#' 
#' @export
blake2b <- function(x, key=NULL)
{
  if (!is.string(x) && !is.raw(x))
    stop("argument 'x' must be a single string or a raw vector", call.=FALSE)
  if (!is.null(key) && !is.string(x) && !is.raw(x))
    stop("argument 'key' must be NULL, a single string, or a raw vector", call.=FALSE)
  
  .Call(R_blake2b, x, key)
}
