library(argon2)

same = function(test, truth) stopifnot(identical(truth, test))
testlen = 10

key = "itsasecrettoeverybody"
rawkey = charToRaw(key)


str = ""

truth = "786A02F742"
hash= blake2b(str)
test = substr(raw_as_char(hash), 1, testlen)
same(test, truth)

truth = "4D571CE893"
hash = blake2b(str, key=key)
test = substr(raw_as_char(hash), 1, testlen)
same(test, truth)

hash = blake2b(str, key=rawkey)
test = substr(raw_as_char(hash), 1, testlen)
same(test, truth)



str = "The quick brown fox jumps over the lazy dog"

truth = "A8ADD4BDDD"
hash = blake2b(str)
test = substr(raw_as_char(hash), 1, testlen)
same(test, truth)

truth = "38F9A5A918"
hash = blake2b(str, key=key)
test = substr(raw_as_char(hash), 1, testlen)
same(test, truth)

hash = blake2b(str, key=rawkey)
test = substr(raw_as_char(hash), 1, testlen)
same(test, truth)



str = charToRaw("letters")

truth = "CA121F037B"
hash = blake2b(str)
test = substr(raw_as_char(hash), 1, testlen)
same(test, truth)

truth = "C61E3D64CF"
hash = blake2b(str, key=key)
test = substr(raw_as_char(hash), 1, testlen)
same(test, truth)

hash = blake2b(str, key=rawkey)
test = substr(raw_as_char(hash), 1, testlen)
same(test, truth)
