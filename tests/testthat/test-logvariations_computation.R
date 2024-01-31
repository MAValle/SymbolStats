library(testthat)

#expect_equal( object = logvariations_computation(prices = c(100, 101, 99, 100), P=3, overlap=3) , expected = -0.01005034 )

# In case overlap > P
#expect_error(  logvariations_computation(prices = c(100, 101, 99, 100), P=1, overlap=3) )

# In case overlap = 0.
#expect_error(  logvariations_computation(prices = c(100, 101, 99, 100), P=1, overlap=0) )



test_that("logvariation function  function works", {
  expect_equal( object = logvariations_computation(prices = c(100, 101, 100, 100), P=3, overlap=3) , expected = 0)

  # In case overlap > P
  #expect_error(  logvariations_computation(prices = c(100, 101, 99, 100), P=1, overlap=3) )

  # In case overlap = 0.
  #expect_error(  logvariations_computation(prices = c(100, 101, 99, 100), P=1, overlap=0) )
})
