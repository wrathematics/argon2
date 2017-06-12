library(argon2)

compare = function(test, truth) stopifnot(identical(truth, test))


str = ""
truth = "786A02F742015903C6C6FD852552D272912F4740E15847618A86E217F71F5419D25E1031AFEE585313896444934EB04B903A685B1448B755D56F701AFE9BE2CE"
hash= blake2b(str)
test = raw_as_char(hash)
compare(test, truth)


str = "The quick brown fox jumps over the lazy dog"
truth = "A8ADD4BDDDFD93E4877D2746E62817B116364A1FA7BC148D95090BC7333B3673F82401CF7AA2E4CB1ECD90296E3F14CB5413F8ED77BE73045B13914CDCD6A918"
hash = blake2b(str)
test = raw_as_char(hash)
compare(test, truth)
