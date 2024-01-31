## ----include=FALSE------------------------------------------------------------
devtools::load_all(".")

## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(SymbolStats)

## ----entropy-example----------------------------------------------------------
str(alldata)
entropy_result <- symbol_entropy(data = sample(c(0,1), 99, replace=TRUE), L = 3, overlap = 1)

