library(argon2)
set.seed(1234)

x = gen_nonce()
stopifnot(identical(length(x), 64L))
stopifnot(identical(typeof(x), "raw"))

x = gen_nonce(32)
stopifnot(identical(length(x), 32L))
stopifnot(identical(typeof(x), "raw"))
