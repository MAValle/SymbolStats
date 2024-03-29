% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/symbol_entropy.R
\name{symbol_entropy}
\alias{symbol_entropy}
\title{Estimate symbol entropy.}
\usage{
symbol_entropy(data, L = 3, overlap)
}
\arguments{
\item{data}{A sequence of binary vector of 0s and 1s.}

\item{L}{The length of the symbol.}

\item{overlap}{A number with the length of the overlap. The overlap has to be grater than 0 and less or equal than L. If overlap is L, then there is no overlapping. If overlap is 1, then the starting value to compute the next variation will be p(t+1).}
}
\value{
A list with 1. table with all symbols, 2. the entropy, and 3. maximum theoretical entropy.
}
\description{
Performs the estimation of symbol entropy, for symbols of predefined length \code{L} on a binary sequence data`.
}
\examples{
# Estimate the entropy of symbols of length L=3, over a binary sequence of
# 99 bits, with overlapping of 1.
rs <- symbol_entropy(data = sample(c(0,1), 99, replace=TRUE), L = 3, overlap=1)

}
