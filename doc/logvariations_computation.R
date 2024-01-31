## ----include=FALSE------------------------------------------------------------
devtools::load_all(".")

## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(SymbolStats)

## ----variation-example--------------------------------------------------------
str(alldata)
returns_result <- logvariations_computation(prices = alldata$`^GSPC`, L=3, overlap=3)
str(returns_result)

