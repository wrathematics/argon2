#' raw_to_char
#' 
#' Convert the literal bytes of a raw (unsigned char*) to a
#' string representation.  This is different from R's
#' \code{rawToChar()}.  See examples for details.
#' 
#' @param raw
#' A raw vector.
#' @param upper
#' Should hex digits A-F be given in uppercase?
#' 
#' @examples
#' library(argon2)
#' str <- "some text"
#' raw <- charToRaw(str)
#' raw
#' 
#' rawToChar(raw)
#' raw_to_char(raw)
#' 
#' @export
raw_to_char <- function(raw, upper=TRUE, spaces=FALSE)
{
  if (!is.raw(raw))
    stop("argument 'raw' must be of raw type")
  
  check.is.flag(upper)
  check.is.flag(spaces)
  
  .Call(R_raw_to_char, raw, upper, spaces)
}
