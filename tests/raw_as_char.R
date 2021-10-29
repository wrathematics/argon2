suppressMessages(library(utils))
library(argon2)

compare = function(test, truth) stopifnot(identical(truth, test))

x = charToRaw("asdfZ")



### spaces = TRUE
truth = capture.output(print(x))
truth = substr(truth, 5, nchar(truth))
test = raw_as_char(x, upper=FALSE, spaces=TRUE)
compare(test, truth)

test = raw_as_char(x, upper=TRUE, spaces=TRUE)
compare(test, toupper(truth))



### spaces = FALSE
truth = paste0(unlist(strsplit(truth, split=" ")), collapse="")
test = raw_as_char(x, upper=FALSE, spaces=FALSE)
compare(test, truth)

test = raw_as_char(x, upper=TRUE, spaces=FALSE)
compare(test, toupper(truth))
