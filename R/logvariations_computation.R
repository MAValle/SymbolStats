#' Computes the variations (log returns) of L periods.
#'
#' logvariations_computation() Computes the variations of values of a time series {p} as log p(t+L) - log p(t).
#'
#' @param prices A vector with prices or values.
#' @param P A period of the variation or return. If for example L=5, the variations are weekly in a finance domain.
#' @param overlap A number with the length of the overlap. The overlap has to be grater than 0 and less or equal than L. If overlap is L, then there is no overlapping. If overlap is 1, then the starting value to compute the next variation will be p(t+1).
# Add returning value description and tag
#' @returns A vector value with log variations.
# Export this function
#' @export
#'
#' @examples
#' # Compute the log return of the SP500 of 3 days, with overlap of 3 days (no overlapping)
#' logvariations_computation(prices = alldata$`^GSPC`, P=3, overlap=3)
#' \dontrun{
#' # overlap > P, that's not possible (gives error)
#' logvariations_computation(prices = c(100, 101, 99, 100), P=1, overlap=3)
#' # overlap = 0, that's not possible (gives error)
#' logvariations_computation(prices = c(100, 101, 99, 100), P=1, overlap=0)
#' }

logvariations_computation <-
function(prices, P, overlap) {
  try(if ( overlap > P ) stop('The argument "overlap" cannot be grater than the period "P" of the variations.', call. = FALSE) )
  try(if ( overlap == 0 ) stop('The argument "overlap" cannot be 0.', call. = FALSE) )

  rets <- numeric()
  cont = 1
  ini = 1
  fin = ini + P -1
  while ( fin  <= length(prices) ) {
    rets[cont] <- log(prices[fin]) -  log(prices[ini] )
    cont = cont + 1
    ini = ini + overlap
    fin = ini + P -1
  }
  return(rets)
}

