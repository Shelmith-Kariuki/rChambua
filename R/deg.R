#' This function calculates the degrees of freedom of a two sample t test.
#'
#' @param n1 : sample size of the first group
#' @param n2 : sample size of the second group
#' @param s1 : standard deviation of the first group
#' @param s2 : standard deviation of the second group
#' @param equal.variance : TRUE if qual variance assumption is made. This should be based on the results of var.test(x,y).
#'
#' @return degrees of freedom
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
#' # Run the deg.freedom2S function to calculate the degrees of freedom
#' n1 <- length(yieldA)
#' n2 <- length(yieldB)
#' s1 <- sd(yieldA)
#' s2 <- sd(yieldB)
#' equal.variance <- TRUE
#'
#' deg.freedom2S(n1, n2, s1, s2, equal.variance)

deg.freedom2S <- function(n1, n2, s1, s2, equal.variance){

  if(equal.variance == TRUE){

    df = n1 + n2 - 2

  }else{
    df = ((s1^2/n1)+(s2^2/n2))^2 / (((1/(n1-1)) * (s1^2/n1)^2) + ((1/(n2-1)) * (s2^2/n2)^2))
  }

  return(df)
}
