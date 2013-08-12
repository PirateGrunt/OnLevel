library(lubridate)
library(ggplot2)
library(PBSmapping)

dfWerner = data.frame(EffectiveDate = mdy(c("7/1/2010", "1/1/2011", "4/1/2012")), RateChange = c(.05, .1, -.01))
GetBracketingAccidentDates(dfWerner$EffectiveDate)
dfAccidentPeriods = AccidentPeriods(dfWerner)

dfAccidentPeriods = AccidentPeriods(dfWerner, policyLength = years(1), accidentPeriodLength = months(6))
dfAccidentPeriods = AccidentPeriods(dfWerner)

dfCompleteTable = CompleteRateChangeTable(dfWerner)
ratePolys = GetPolygons(dfCompleteTable)
lapply(ratePolys, calcArea)
PlotPolygons(ratePolys)

ayPolys = GetPolygons(dfAccidentPeriods)
PlotPolygons(ayPolys, add=TRUE)