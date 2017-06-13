#' Password Hashing
#' 
#' Basic password hashing.  Use \code{pw_hash()} to hash and \code{pw_check()}
#' to compare a possible password with the hashed password.
#' 
#' The default options for \code{iterations} and \code{memory} should be
#' sufficient for most purposes.  You are encouraged to read the official
#' documentation before modifying these values, which can be found here
#' \url{https://github.com/P-H-C/phc-winner-argon2/blob/master/argon2-specs.pdf}.
#' 
#' On the other hand, \code{nthreads} is safe to change to fit your available
#' resources, and you are encouraged to do so.
#' 
#' @details
#' This uses the argon2 (i or d variety) hash algorithm.  See references for
#' details and implementation source code (also bundled with this package).
#' 
#' Our binding uses a 512 bit salt with data generated from MT.
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



#' @param pass
#' The (plaintext) password.
#' @param variant
#' Choice of algorithm; currently the only supported choices are "i" and "d".
#' @param iterations
#' A time cost. Recommended to be at least 10. Can be any integer from 1 to
#' 2^31 - 1.
#' @param memory
#' A memory cost, given in MiB. Recommended to be at least 8.  Can be any
#' integer from 1 to 2^21 - 1 (but don't be ridiculous).
#' @param nthreads
#' Number of threads.  This affects the speed of hashing, so more is better.
#' 
#' @rdname hashing
#' @export
pw_hash <- function(pass, variant="i", iterations=16, memory=8, nthreads=2)
{
  variant <- match.arg(tolower(variant), c("i", "d"))
  check.is.string(pass)
  
  check.is.posint(iterations)
  check.is.posint(memory)
  check.is.posint(nthreads)
  
  if (memory > 2^22 - 1)
    stop("argument 'memory' must be between 1 and 2^22-1. And 8 would do by the way.")
  
  hash = .Call(R_argon2_hash, pass, variant, as.integer(iterations), 1024L*as.integer(memory), as.integer(nthreads))
  attr(hash, "hashtype") = "argon2"
  
  hash
}



#' @param hash
#' The hashed password; this is the output of \code{pw_hash()}.
#' 
#' @rdname hashing
#' @export
pw_check <- function(hash, pass)
{
  if (!isTRUE(attr(hash, "hashtype") == "argon2"))
    stop("argument 'hash' must be an argon2 hash, returned from argon2::pw_hash()")
  
  check.is.string(hash)
  check.is.string(pass)
  
  .Call(R_argon2_verify, hash, pass)
}
