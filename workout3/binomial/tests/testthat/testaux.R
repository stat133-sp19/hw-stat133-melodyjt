context("Private auxiliary funcs")

test_that("Correct aux_mean", {
  expect_equal(aux_mean(4, 0.5), 2)
  expect_equal(aux_mean(0, 0.3), 0)
  expect_equal(aux_mean(3, 0), 0)
})

test_that("Correct aux_variance", {
  expect_equal(aux_variance(4, 0.5), 1)
  expect_equal(aux_variance(0, 0.3), 0)
  expect_equal(aux_variance(2, 0.7), 0.42)
})

test_that("Correct aux_mode", {
  expect_equal(aux_mode(4, 0.5), 2)
  expect_equal(aux_mode(0, 0.3), 0)
  expect_equal(aux_mode(5, 0.2), 1)
})

test_that("Correct aux_skewness", {
  expect_equal(aux_skewness(4, 0.5), 0)
  expect_equal(aux_skewness(2, 0.3), 0.6172134)
  expect_equal(aux_skewness(3, 0.2), 0.8660254)
})

test_that("Correct aux_kurtosis", {
  expect_equal(aux_kurtosis(4, 0.5), -0.5)
  expect_equal(aux_kurtosis(2, 0.5), -1)
  expect_equal(aux_kurtosis(1, 0.2), 0.25)
})
