context("Main functions")

test_that("bin_choose works", {
  expect_equal(bin_choose(n = 5, k = 2), 10)
  expect_equal(bin_choose(5, 0), 1)
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
  expect_error(bin_choose(5, 6))
  expect_error(bin_choose(4, 1:5))
})

test_that("bin_probability works", {
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_equal(bin_probability(0:2, 5, 0.5), c(0.03125, 0.15625, 0.31250))
  expect_equal(bin_probability(55, 100, 0.45), 0.01075277)
  expect_error(bin_probability(1:6, 3, 0.2))
  expect_error(bin_probability(2, 3.5, 0.5))
  expect_error(bin_probability(2, 5, -1))
})

test_that("bin_distribution works", {
  expect_equal(class(bin_distribution(5, 0.5)), c("bindis", "data.frame"))
  expect_error(bin_distribution(5, -1))
  expect_error(bin_distribution(1, -0.5))
  expect_error(bin_distribution(4, 2))
})

test_that("bin_cumulative works", {
  expect_equal(class(bin_cumulative(5, 0.5)), c("bincum", "data.frame"))
  expect_error(bin_cumulative(5, -1))
  expect_error(bin_cumulative(1, -0.5))
  expect_error(bin_cumulative(4, 2))
})

test_that("bin_variable works", {
  expect_equal(class(bin_variable(5, 0.5)), "binvar")
  expect_error(bin_variable(5, -1))
  expect_error(bin_variable(-1, 0.5))
  expect_equal(typeof(bin_variable(5, 0.5)), "list")
})
