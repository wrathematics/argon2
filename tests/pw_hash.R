library(argon2)

test.hash = function(hash, pass)
{
  stopifnot(pw_check(hash, pass))
  stopifnot(!pw_check(hash, "password"))
}

set.seed(1234)
pass = "myPassw0rd!"

hash = pw_hash(pass, variant="i")
test.hash(hash, pass)

hash = pw_hash(pass, variant="d")
test.hash(hash, pass)
