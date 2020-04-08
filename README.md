
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rChambua

<!-- badges: start -->

<!-- badges: end -->

Chambua is the swahili word for "Analyze".

rChambua contains sample datasets and simple data analysis functions.

## Installation

You can install the development version of rChambua from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Shelmith-Kariuki/rChambua")
```

And the released version from [CRAN](https://CRAN.R-project.org) with:

Note: This package is not yet available on CRAN. 
``` r
install.packages("rChambua")
```

## Example

To read in the `Wafanyikazi` dataset, use the code below

``` r
library(rChambua)
df <- wafanyikazi
```

To calculate the t-statistic of a 2 sample t test "by hand", follow the example below

``` r
# Suppose we have the yield of corn for two types of fertilizer, A and B.
# Test to see whether there is a difference in the means of yield produced,
# from application of both types of fertilizers.
# H0: UA = UB , H1: UA != UB

yieldA <- c(452, 874, 554, 447, 356, 754 , 558, 574, 664, 682, 547, 435, 245)
yieldB <- c(546, 547, 774, 465, 459, 665, 467, 365, 589, 534, 456, 651, 654, 665, 546, 537)

# Perform an F test to compare the variances of the two samples
var.test(yieldA, yieldB) ## Results of this test indicate that we can assume equal variance

# Run the tcalc function to calculate the test statistic
n1 <- length(yieldA)
n2 <- length(yieldB)
s1 <- sd(yieldA)
s2 <- sd(yieldB)
barx1 <- mean(yieldA)
barx2 <- mean(yieldB)
hypothesised.diff <- 0
equal.variance <- TRUE

tcalc2S(n1, n2, s1, s2, barx1, barx2,  hypothesised.diff, equal.variance)

```


