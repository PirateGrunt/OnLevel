GetBracketingAccidentDates = function(EffectiveDates, policyLength = years(1), accidentPeriodLength = years(1), firstMonth = 1, firstDay = 1)
{
  require(lubridate)
  
  EarliestRateDate = min(EffectiveDates)
  LatestRateDate = max(EffectiveDates) + policyLength - days(1)
  firstDate = mdy("1/1/1900")
  tz(firstDate) = tz(EffectiveDates[1])
  year(firstDate) = year(EarliestRateDate)
  month(firstDate) = firstMonth
  day(firstDate) = firstDay
  if (firstDate > EarliestRateDate) year(firstDate) = year(firstDate) - 1
  
  numPeriods = suppressMessages(new_interval(firstDate, LatestRateDate) / accidentPeriodLength) + 1
  lastDate = firstDate + accidentPeriodLength * numPeriods - days(1)
  
  retVal = list(FirstDate = firstDate, LastDate = lastDate, AccidentPeriods = numPeriods)
  retVal
}

AccidentPeriods = function(df, policyLength = years(1), accidentPeriodLength = years(1), firstMonth = 1, firstDay = 1)
{
  require(lubridate)
  
  lstBrackets = GetBracketingAccidentDates(df$EffectiveDate, policyLength, accidentPeriodLength, firstMonth, firstDay)
  
  dfAP = data.frame(APStart = rep(lstBrackets$FirstDate, lstBrackets$AccidentPeriods))
  dfAP$APStart = dfAP$APStart + accidentPeriodLength * (0:(lstBrackets$AccidentPeriods-1))
  
  dfAP$APEnd = dfAP$APStart + accidentPeriodLength - days(1)
  
  dfAP$X1 = dfAP$APStart
  dfAP$X2 = dfAP$APEnd
  dfAP$X3 = dfAP$APEnd
  dfAP$X4 = dfAP$APStart
  
  dfAP$X1 = DayDifference(dfAP$APStart[1], dfAP$X1)
  dfAP$X2 = DayDifference(dfAP$APStart[1], dfAP$X2)
  dfAP$X3 = DayDifference(dfAP$APStart[1], dfAP$X3)
  dfAP$X4 = DayDifference(dfAP$APStart[1], dfAP$X4)
  
  row.names(dfAP) = NULL
  dfAP
}
