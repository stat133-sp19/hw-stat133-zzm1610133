context('Check Binomial')

test_that('Check the combinatorial number', {
  expect_equal(bin_choose(5,1),5)
  expect_error(bin_choose(3,5))
  expect_error(bin_choose(5,'a'))
  expect_error(bin_choose(5,2.5))
  expect_equal(bin_choose(5,0:2),c(1,5,10))
})

test_that('Check the distribution of the binomial distribution',{
  expect_is(bin_distribution(10,0.5),c('data.frame','bindis'))
  expect_equal(ncol(bin_distribution(10,0.5)),2)
  expect_equal(nrow(bin_distribution(10,0.5)),11)
  expect_error(bin_distribution(3,4))
})

test_that('Check the cumulative of the binomial distribution',{
  expect_is(bin_distribution(10,0.5),c('data.frame','bincum'))
  expect_equal(ncol(bin_cumulative(10,0.5)),3)
  expect_equal(nrow(bin_cumulative(10,0.5)),11)
  expect_error(bin_distribution(3,4))
})
