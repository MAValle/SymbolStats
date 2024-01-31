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
entropy_result <- symbol_entropy(data = sample(c(0,1), 99, replace=TRUE), L = 3)

## ----entropy-example2---------------------------------------------------------
library(dplyr)
library(tidyr)
str(alldata)

# The sp500 prices
sp5 <- alldata %>% select('^GSPC') %>% drop_na

# Compute the SP500 daily returns using the `logvariations_computation` function.
sp5_returns <- logvariations_computation(prices = as.numeric(sp5$`^GSPC`), L=2, overlap=1)

# Binarizing the returns
sp5_binary <- as.data.frame(sp5_returns) %>% mutate(across(everything(), ~case_when(.x >= 0 ~ 1, .x < 0 ~ 0, TRUE ~ NA_real_)))

# Estimating entropy
entropy_result <- symbol_entropy(data = sp5_binary$sp5_returns, L = 3)

