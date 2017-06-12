# argon2

* **Version:** 0.2-0
* **Status:** [![Build Status](https://travis-ci.org/wrathematics/argon2.png)](https://travis-ci.org/wrathematics/argon2)
* **License:** [BSD 2-Clause](https://opensource.org/licenses/BSD-2-Clause)
* **Author:** Drew Schmidt (wrathematics .AT. gmail .DOT. com)
* **Project home**: https://github.com/wrathematics/argon2
* **Bug reports**: https://github.com/wrathematics/argon2/issues


**argon2** is an R package for secure password hashing via the argon2 algorithm.  It is a relatively new hashing algorithm and is believed to be very secure.  The package also includes some utilities that should be useful for digest authentication, including a wrapper of blake2b.  For similar R packages, see **sodium** and **bcrypt**.

The package includes a source distribution of the latest implementation from the argon2 developers: https://github.com/P-H-C/phc-winner-argon2.  Note that we are unaffiliated with their project; if we break something, don't blame them!



## Installation

You can install the stable version from CRAN using the usual `install.packages()`:

```r
install.packages("argon2")
```

The development version is maintained on GitHub, and can easily be installed by any of the packages that offer installations from GitHub:

```r
### Pick your preference
devtools::install_github("wrathematics/argon2")
ghit::install_github("wrathematics/argon2")
remotes::install_github("wrathematics/argon2")
```



## Usage

```r
library(argon2)

pass <- "myPassw0rd!"
hash <- pw_hash(pass)
hash
## [1] "$argon2i$v=19$m=8192,t=20,p=1$KZrdgD04xYK158QoZUEJgQb0QgayasYvjl98hRXf5C7cCqDr/MPARFdp4HtnrSrpZr70SupTrfGVfovUp81VeA$V8WHHdR7a4S0RTOFDAjJCHIerlIjzsPAuPu0rT2lpnObmNOUhldPIgEqBzxQBF71tyjsEIuuRMdG/b5JN3omiA"
## attr(,"hashtype")
## [1] "argon2"

pw_check(hash, pass)
## [1] TRUE
pw_check(hash, "password")
## [1] FALSE
pw_check(hash, "1234")
## [1] FALSE
```
