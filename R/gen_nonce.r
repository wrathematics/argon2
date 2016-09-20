#' Generate a nonce
#' 
#' Generates a random raw (unsigned char*) vector.
#' 
#' @param length
#' The number of items to return. Default is 128 items, which
#' is 512 hex bits.
#' 
#' @return
#' A random raw vector.
#' 
#' @export
gen_nonce <- function(length=128)
{
  check.is.posint(length)
  
  .Call(R_gen_nonce, as.integer(length))
}
