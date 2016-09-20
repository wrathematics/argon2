#' Generate a nonce
#' 
#' Generates a random raw (unsigned char*) vector.
#' 
#' @param length
#' The number of items to return. Default is 64 items, which
#' is 512 hex bits.
#' 
#' @return
#' A random raw vector.
#' 
#' @export
gen_nonce <- function(length=64)
{
  check.is.posint(length)
  
  .Call(R_gen_nonce, as.integer(length))
}
