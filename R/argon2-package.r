#' argon2
#'
#' Utilities for secure password hashing via the argon2 algorithm.
#' It is a relatively new hashing algorithm and is believed to be very secure.
#' The argon2 implementation included in the package is the reference
#' implementation.  The package also includes some utilities that should be
#' useful for digest authentication, including a wrapper of blake2b.  For
#' similar R packages, see sodium and bcrypt.
#' 
#' @references Project URL: \url{https://github.com/wrathematics/argon2}
#' @author Drew Schmidt
#' 
#' @name argon2-package
#' 
#' @useDynLib argon2 R_argon2_hash R_argon2_verify R_gen_nonce
#'   R_blake2b R_raw_to_char
#'
#' @docType package
#' @keywords package
NULL
