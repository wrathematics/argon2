library(argon2)

test.hash = function(hash, pass)
{
  stopifnot(pw_check(hash, pass))
  stopifnot(!pw_check(hash, "password"))
}

set.seed(1234)
pass = "myPassw0rd!"

hash = pw_hash(pass, variant="i", iterations=5, memory=2, nthreads=1)
test.hash(hash, pass)

hash = pw_hash(pass, variant="i", iterations=10, memory=4, nthreads=1)
test.hash(hash, pass)



hash = pw_hash(pass, variant="d", iterations=5, memory=2, nthreads=1)
test.hash(hash, pass)

hash = pw_hash(pass, variant="d", iterations=10, memory=4, nthreads=1)
test.hash(hash, pass)
