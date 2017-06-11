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
#' @references
#' Aumasson, J.P., Neves, S., Wilcox-O'Hearn, Z. and Winnerlein, C., 2013, June.
#' BLAKE2: simpler, smaller, fast as MD5. In International Conference on Applied
#' Cryptography and Network Security (pp. 119-135). Springer Berlin Heidelberg.
#' 
#' @examples
#' \dontrun{
#' library(argon2)
#' blake2b("some string")
#' blake2b("another")
#' }
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
