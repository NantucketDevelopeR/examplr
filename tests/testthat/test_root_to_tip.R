library(testthat)
library(ape)

test_that("Test root_to_tip()", {
  t <-read.tree("testdata/sample.tre")
  dist_vector <- c(0.9396720, 1.0072302, 2.5236961, 2.8342391, 2.7986464,
              0.0000000, 0.9181988, 1.5325504, 2.2022753)
  expect_equal(dist_vector, root_to_tip(t), tolerance = .0005)
})
