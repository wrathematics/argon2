#' blake2b
#' 
#' A 512-bit blake2b hash implementation.
#' 
#' @param x
#' Input string.
#' @param key
#' An optional key.
#' 
#' @return
#' The hash of the string as a raw vector.
#' 
#' @export
blake2b <- function(x, key=NULL)
{
  check.is.string(x)
  check.is.string.or.null(key)
  
  ret <- .Call(R_blake2b, x, key)
  
  ret
}
