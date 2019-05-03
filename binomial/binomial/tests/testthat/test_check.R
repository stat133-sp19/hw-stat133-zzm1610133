context('Check Checkers')

test_that('Check whether prob checker works', {
  expect_equal(check_prob(0.5),TRUE)
  expect_error(check_prob(1.2))
  expect_error(check_prob(-0.7))
  expect_error(check_prob('a'))
})

test_that('Check whether trials checker works', {
  expect_equal(check_trials(5),TRUE)
  expect_error(check_trials(-5))
  expect_error(check_trials('a'))
  expect_error(check_trials(2.1))
})

test_that('Check whether success checker works', {
  expect_equal(check_success(c(4,3,6,0),8),TRUE)
  expect_error(check_success(c(6,3,2,1),5))
  expect_error(check_success(c(5,'a',2,1),5))
  expect_error(check_success(c(0,3,2.1,1),5))
})
