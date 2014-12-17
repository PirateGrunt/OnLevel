#' This will produce a data set

Policy = data.frame(Policy = c('A', 'B', 'C', 'D', 'E', 'F')
                    , EffectiveDate = c(  as.Date('2010-10-01')
                                        , as.Date('2011-01-01')
                                        , as.Date('2011-04-01')
                                        , as.Date('2011-07-01')
                                        , as.Date('2011-10-01')
                                        , as.Date('2012-01-01'))
                    , ExpirationDate = c(  as.Date('2011-09-30')
                                         , as.Date('2011-12-31')
                                         , as.Date('2012-03-31')
                                         , as.Date('2012-06-30')
                                         , as.Date('2012-09-30')
                                         , as.Date('2012-12-31'))
                    , Premium = c(200, 250, 300, 400, 350, 225))

save(Policy, file="./data/Policy.rda")
