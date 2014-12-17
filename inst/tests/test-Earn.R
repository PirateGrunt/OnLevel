context("EarnedPremium")

test_that("CalcEarnedPremium", {
  data(Policy)
  ep2010 <- Earned(Policy$EffectiveDate, Policy$ExpirationDate
                 , as.Date("2010-01-01")
                 , as.Date("2010-12-31")
                 , Policy$Premium)
  
  expect_equal(round(ep2010, 5)
               , c(50.41096, 0.00000, 0.00000
                         , 0.00000, 0.00000, 0.00000))
  
  ep2011 <- Earned(Policy$EffectiveDate, Policy$ExpirationDate
                  , as.Date("2011-01-01")
                  , as.Date("2011-12-31")
                  , Policy$Premium)
  
  expect_equal(round(ep2011, 5), c(149.58904, 250.00000, 225.40984
                         , 201.09290, 87.97814, 0.00000))
  
  ep2012 <- Earned(Policy$EffectiveDate, Policy$ExpirationDate
                  , as.Date("2012-01-01")
                  , as.Date("2013-12-31")
                  , Policy$Premium)
  
  expect_equal(round(ep2012, 5), c(0.00000, 0.00000, 74.59016
                         , 198.90710, 262.02186, 225.00000))
  
})
