#' Compute number of times returns (or values) are inside a box
#'
#' This is a function required to operate the Fisher Information function. It
#' computes the number of times that a values appears in each intervals.
#'
#' @param rets A numeric vector with returns (or values) to be computed the Fisher Information.
#' @param lims A vector with the interval limits of width w from minimum to maximum value.
#' @returns A vector of the same length than lims with numbers of values inside each interval.
# Export this function
#' @export
#'
#' @examples
#' # Compute the intervals for a sequence of white noise
#' white_noise <- rnorm(50)
#' n <- 10 # number of intervals in which we split all the values of white noise
#' w <- diff(range(white_noise)) / n
#' lims <- seq(min(white_noise), max(white_noise), w) # we compute the interval limits
#' sumvalues(rets = white_noise, lims = lims)
#'
sumvalues <- function(rets, lims) {
  vls <- vector()
  for ( i in 2:length(lims)) {
    vls[i-1] <- sum(rets >= lims[i-1] & rets < lims[i])
    #print(vls)
  }
  return(vls)
}
