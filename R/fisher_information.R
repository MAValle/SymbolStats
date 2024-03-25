#' Compute the Fisher Information (FI) from a given time series.
#'
#' The FI is useful because it serves as a measure that acts as a "detector"
#' of changes in series dynamics.  Please see the paper by Martin, Perez,
#' and Plastino.
#'
#' Reference: Martin, M. T., Perez, J., & Plastino, A. (2001). Fisher
#' information and nonlinear dynamics. Physica A: Statistical Mechanics and its
#' Applications, 291(1-4), 523-532.
#'
#' @param rets A numeric vector with returns (or values) to be computed the
#' Fisher Information.
#' @param splits Choose the number of intervals in which you are going to split
#' all the values.
#' @returns A Dataframe with two columns: the used split, ans the  FI measure.
#' @export
#'
#' @examples
#' # Compute the FI for white noise using splits from 3 to 12.
#' white_noise <- rnorm(50)
#' r <- Fisher_Information(rets = white_noise, splits=c(3:12))
#' library(ggplot2)
#' ggplot(r, aes(x=factor(split), y=fi)) + geom_boxplot(fill='#A4A4A4',
#' color="black") + labs(title="Fisher-Information",x="Split window", y = "FI") +
#' theme_classic()
#'
Fisher_Information <- function(rets, splits = c(3:12) ) {
  almacen_split2 <- matrix(NA, ncol=2, nrow=length(splits))
  for ( i in 1:length(splits) ) {
    n = splits[i]
    # Compute the interval widths
    w <- diff(range(rets)) / n
    # Compute the interval limits
    lims <- seq(min(rets), max(rets), w)
    # Compute the interval probabilities
    p <- sumvalues(rets = rets, lims = lims)
    p <- p / sum(p)

    # calculo FI  segun "Fisher Information and nonlinear dynamics"
    fi2 <- sum (  ((diff(p))^2)/p[-1]  )
    # sacamos valores en que p=0
    drops <- which(p == 0)
    if (length(drops) > 0) {
      print(drops)
      p <- p[-drops]
    }

    # save data
    almacen_split2[i, ] <- c(n, fi2)
  }
  colnames(almacen_split2) <- c('split', 'fi')
  almacen_split2 <- as.data.frame(almacen_split2)
  return(almacen_split2)
}
