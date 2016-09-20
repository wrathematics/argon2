library(argon2)

set.seed(1234)
pass <- "myPassw0rd!"
hash <- pw_hash(pass)

stopifnot(pw_check(hash, pass))
stopifnot(!pw_check(hash, "password"))
stopifnot(!pw_check(hash, "1234"))
