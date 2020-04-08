#' This function calculates the t-statistic of a two sample t test.
#'
#' @param n1 : sample size of the first group
#' @param n2 : sample size of the second group
#' @param s1 : standard deviation of the first group
#' @param s2 : standard deviation of the second group
#' @param barx1 : mean of the first group
#' @param barx2 : mean of the second group
#' @param hypothesised.diff : hypothesised difference in means (often 0)
#' @param equal.variance : TRUE if qual variance assumption is made. This should be based on the results of var.test(x,y).
#'
#' @return t-statistic
#' @export
#'
#' @examples
#' # Suppose we have the yield of corn for two types of fertilizer, A and B.
#' # Test to see whether there is a difference in the means of yield produced, from application of both types of fertilizers.
#' # H0: UA = UB , H1: UA != UB
#'
#' yieldA <- c(452, 874, 554, 447, 356, 754 , 558, 574, 664, 682, 547, 435, 245)
#' yieldB <- c(546, 547, 774, 465, 459, 665, 467, 365, 589, 534, 456, 651, 654, 665, 546, 537)
#'
#' # Perform an F test to compare the variances of the two samples
#' var.test(yieldA, yieldB) ## Results of this test indicate that we can assume equal variance
#'
#' # Run the tcalc function to calculate the test statistic
#' n1 <- length(yieldA)
#' n2 <- length(yieldB)
#' s1 <- sd(yieldA)
#' s2 <- sd(yieldB)
#' barx1 <- mean(yieldA)
#' barx2 <- mean(yieldB)
#' hypothesised.diff <- 0
#' equal.variance <- TRUE
#'
#' tcalc(n1, n2, s1, s2, barx1, barx2,  hypothesised.diff, equal.variance)

tcalc <- function(n1, n2, s1, s2, barx1, barx2,  hypothesised.diff, equal.variance){

  if(equal.variance == TRUE){

  tcalc = (barx1 - barx2 - hypothesised.diff)/ (sqrt(((n1-1)*s1^2 + (n2-1)*s2^2) / (n1 + n2 - 2)) * sqrt((1/n1)+(1/n2)))

  }else{
    tcalc = (barx1 - barx2 - hypothesised.diff)/ sqrt((s1^2/n1)+(s2^2/n2))
  }

  return(tcalc)
}
