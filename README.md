# argon2

* **Version:** 0.1-0
* **URL**: https://github.com/wrathematics/argon2
* **Status:** [![Build Status](https://travis-ci.org/wrathematics/argon2.png)](https://travis-ci.org/wrathematics/argon2)
* **License:** [![License](http://img.shields.io/badge/license-BSD%202--Clause-orange.svg?style=flat)](http://opensource.org/licenses/BSD-2-Clause)
* **Author:** Drew Schmidt


**argon2** is an R package for secure password hashing.  The package includes a source distribution of https://github.com/P-H-C/phc-winner-argon2



## Usage

```r
library(argon2)

pass <- "myPassw0rd!"
hash <- pw_hash(pass)
hash

pw_check(hash, pass)
pw_check(hash, "password")
pw_check(hash, "1234")
```



## Installation

<!-- You can install the stable version from CRAN using the usual `install.packages()`:

```r
install.packages("argon2")
``` -->

The development version is maintained on GitHub, and can easily be installed by any of the packages that offer installations from GitHub:

```r
### Pick your preference
devtools::install_github("wrathematics/argon2")
ghit::install_github("wrathematics/argon2")
remotes::install_github("wrathematics/argon2")
```
