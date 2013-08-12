CompleteRateChangeTable = function(df, policyLength = years(1), accidentPeriodLength = years(1), firstMonth = 1, firstDay = 1)
{
  require(lubridate)

  lstBrackets = GetBracketingAccidentDates(df$EffectiveDate, policyLength, accidentPeriodLength, firstMonth, firstDay)
  
  # Add a row for the leading date. 
  df = rbind(df, data.frame(EffectiveDate = lstBrackets$FirstDate, RateChange = 0))
  numRows = nrow(df)
  
  df$RateChangeFactor = df$RateChange + 1
  df = df[order(df$EffectiveDate),]
  df$CumulativeRate = cumprod(df$RateChangeFactor)
  
  # The "expiration" date corresponds to the date that the next rate change goes into effect.
  df$ExpirationDate = df$EffectiveDate
  df$ExpirationDate[1:(numRows-1)] = df$EffectiveDate[2:numRows]
  df$ExpirationDate[numRows] = lstBrackets$LastDate
  
  df$X1 = df$EffectiveDate
  df$X2 = df$X1
  
  df$X2[1:(numRows-1)] = df$X1[2:numRows]
  df$X2[numRows] = lstBrackets$LastDate
  
  df$X3 = df$X2 + policyLength - days(1)
  df$X3[numRows] = df$X2[numRows]
  
  df$X4 = df$X1 + policyLength - days(1)
  df$X4[1] = df$X1[1]
  
  df$X1 = DayDifference(df$EffectiveDate[1], df$X1)
  df$X2 = DayDifference(df$EffectiveDate[1], df$X2)
  df$X3 = DayDifference(df$EffectiveDate[1], df$X3)
  df$X4 = DayDifference(df$EffectiveDate[1], df$X4)
  
  row.names(df) = NULL
  
  df
}