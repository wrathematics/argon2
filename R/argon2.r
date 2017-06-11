#' Password Hashing
#' 
#' Basic password hashing.  Use \code{pw_hash()} to hash and \code{pw_check()}
#' to compare a possible password with the hashed password.
#' 
#' For more hashing options, see the sodium and bcrypt.
#' 
#' @details
#' This uses the argon2 (i or d variety) hash algorithm.  See references for
#' details and implementation source code (also bundled with this package).
#' 
#' Our binding uses a 512 bit salt with data generated from MT, a "time cost"
#' (number of passes) of 16, "memory cost" of 8192 MiB, and 1 thread.
#' 
#' @param pass
#' The (plaintext) password.
#' @param type
#' Choice of algorithm; choices are "i" and "d".
#' @param hash
#' The hashed password; this is the output of \code{pw_hash()}.
#' 
#' @return
#' \code{pw_hash()} returns a hash to be used as an input to \code{pw_check()}.
#' 
#' \code{pw_check()} returns \code{TRUE} or \code{FALSE}, whether or not
#' the plaintext password matches its hash.
#' 
#' @references
#' Biryukov, A., Dinu, D. and Khovratovich, D., 2015. Fast and
#' Tradeoff-Resilient Memory-Hard Functions for Cryptocurrencies and Password
#' Hashing. IACR Cryptology ePrint Archive, 2015, p.430.
#' 
#' Reference implementation \url{https://github.com/P-H-C/phc-winner-argon2}
#' 
#' @examples
#' \dontrun{
#' library(argon2)
#' 
#' pass <- "myPassw0rd!"
#' hash <- pw_hash(pass)
#' hash # store this
#' 
#' pw_check(hash, pass)
#' pw_check(hash, "password")
#' pw_check(hash, "1234")
#' }
#' 
#' @name hashing
#' @rdname hashing
NULL



#' @rdname hashing
#' @export
pw_hash <- function(pass, type="i")
{
  type <- match.arg(tolower(type), c("i", "d"))
  check.is.string(pass)
  
  hash <- .Call(R_argon2_hash, pass, type)
  attr(hash, "hashtype") <- "argon2"
  
  hash
}



#' @rdname hashing
#' @export
pw_check <- function(hash, pass)
{
  if (!isTRUE(attr(hash, "hashtype") == "argon2"))
    stop("argument 'hash' must be an argon2 hash, returned from argon2_hash()")
  
  check.is.string(hash)
  check.is.string(pass)
  
  .Call(R_argon2_verify, hash, pass)
}
