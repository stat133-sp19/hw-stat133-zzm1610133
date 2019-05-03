context("Check Summary Measures")

test_that('check aux_mean', {
  expect_equal(aux_mean(10,0.5),5)
  expect_equal(aux_mean(5,0.4),2)
  expect_type(aux_mean(2.5,0.4),'double')
})

test_that('check aux_variance', {
  expect_equal(aux_variance(10,0.5),2.5)
  expect_equal(aux_variance(2.5,0.4),0.6)
  expect_type(aux_variance(5,0.4),'double')
})

test_that('check aux_mode',{
  expect_equal(aux_mode(10,0.5),5)
  expect_equal(aux_mode(9,0.5),c(5,4))
  expect_type(aux_mode(10,0.5), 'double')
  expect_type(aux_mode(9,0.5), 'double')
})

test_that('check aux_skewness',{
  expect_equal(aux_skewness(10,0.5),0)
  expect_equal(aux_skewness(10,0.3),0.4/sqrt(2.1))
  expect_type(aux_skewness(10,0.3), 'double')
  expect_equal(aux_skewness(10,0),'Undefined')
})

test_that('check kurtosis',{
  expect_equal(aux_kurtosis(10,0.5),-0.2)
  expect_equal(aux_kurtosis(5,0.3),-0.26/1.05)
  expect_type(aux_skewness(10,0.3),'double')
  expect_equal(aux_skewness(10,0),'Undefined')
})
