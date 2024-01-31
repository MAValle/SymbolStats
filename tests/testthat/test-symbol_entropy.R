library(testthat)
bits <- c(0,0,0,1,1,0,1,0,1,0,1,1,1,1,0,0,1,0,1,0, 0,0,0,1,1,0,1,0,1,0,1,1,1,1,0,0,1,0,1,0)
rs <- symbol_entropy(data = bits, L = 2, overlap=1)



#expect_equal(  object = rs[[2]], expected = 1.35857 )

# In case L=1. No sense to have symbols of length L=1
#expect_warning(  symbol_entropy(data = bits, L = 1, overlap=1) )

# In case overlap = 0.
#expect_warning(  symbol_entropy(data = bits, L = 3, overlap=0) )




test_that("Symbol entropy estimation function works", {
  expect_equal(  object = rs[[2]], expected = 1.3585703 )

  # In case L=1. No sense to have symbols of length L=1
  #expect_error(  symbol_entropy(data = bits, L = 1, overlap=1) )

  # In case overlap = 0.
  #expect_error(  symbol_entropy(data = bits, L = 3, overlap=0) )
})


