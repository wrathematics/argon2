library(argon2)
x = charToRaw("asdfZ")

truth <- capture.output(print(x))
truth <- substr(truth, 5, nchar(truth))

stopifnot(identical(truth, raw_as_char(x, FALSE, TRUE)))
stopifnot(identical(toupper(truth), raw_as_char(x, TRUE, TRUE)))

truth <- paste0(unlist(strsplit(truth, split=" ")), collapse="")
stopifnot(identical(truth, raw_as_char(x, FALSE, FALSE)))
stopifnot(identical(toupper(truth), raw_as_char(x, TRUE, FALSE)))
