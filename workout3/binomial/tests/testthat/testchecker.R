context("Private checker funcs")

test_that("Valid prob", {
  expect_true(check_prob(0.5))
  expect_error(check_prob(c(0.3, 0.5)))
  expect_error(check_prob(2))
})

test_that("Valid trials", {
  expect_true(check_trials(0))
  expect_error(check_trials(0.5))
  expect_error(check_trials(-1))
})

test_that("Valid success", {
  expect_true(check_success(1, 4))
  expect_true(check_success(1:3, 5))
  expect_error(check_success(1:6, 3))
  expect_error(check_success(c(1, 2, 3.5), 4))
})
