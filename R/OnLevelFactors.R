#' @export
GetEarnWidthDays = function(EarnPeriodStart, EarnPeriodEnd)
{
  EarnWidthDays = new_interval(EarnPeriodStart, EarnPeriodEnd + days(1))
  EarnWidthDays = EarnWidthDays / days(1)
  
  return (EarnWidthDays)
}

# GetEarnArea = function(EarnPeriodStart, EarnPeriodEnd, PolicyTerm){
#   require(lubridate)
#   
#   EarnWidthDays = GetEarnWidthDays(EarnPeriodStart, EarnPeriodEnd)
#   PolicyTermDays = PolicyTerm / days(1)
#   EarnArea = EarnWidthDays * PolicyTermDays
#   
#   return(EarnArea)
# }
# 
# GetAreas = function(BeginMinusOne, EndMinusOne, EarnPeriodStart, EarnPeriodEnd, EarnArea, EarnWidthDays, dfRateChanges)
# {
#   require(lubridate)
#   Area = numeric(length = nrow(dfRateChanges))
#   
#   for (i in 1:nrow(dfRateChanges)){
#     if (dfRateChanges$RateDate[i] < EndMinusOne){
#       length = new_interval(BeginMinusOne, dfRateChanges$RateDate[i] + days(1)) / days(1)
#       Area[i] = 0.5 * length ^ 2
#       Area[i] = EarnArea - Area[i]
#     }
#     else if (dfRateChanges$RateDate[i] < EarnPeriodStart){
#       length1 = new_interval(dfRateChanges$RateDate[i], EarnPeriodStart + days(1)) / days(1)
#       length2 = new_interval(dfRateChanges$RateDate[i], EarnPeriodEnd + days(1)) / days(1)
#       Area[i] = 0.5 * EarnWidthDays * (length1 + length2)
#     }
#     else if (dfRateChanges$RateDate[i] < EarnPeriodEnd){
#       length = new_interval(dfRateChanges$RateDate[i], EarnPeriodEnd + days(1)) / days(1)
#       Area[i] = 0.5 * length ^ 2
#     }
#     
#   }
#   
#   return (Area)
# }
# 
# GetEarliestRateLevel = function(dfRateChanges, BeginMinusOne)
# {
#   EarliestRateLevel = dfRateChanges[dfRateChanges$RateDate <= BeginMinusOne,"CumulativeRateLevels"]
#   if (length(EarliestRateLevel) == 0){
#     EarliestRateLevel = 1.0
#   } else {
#     EarliestRateLevel = EarliestRateLevel[length(EarliestRateLevel)]  
#   }
#   
#   return(EarliestRateLevel)
# }
# 
# AverageRateLevel = function(EarnPeriodStart, EarnPeriodEnd, PolicyTerm, dfRateChanges)
# {
#   require(lubridate)
#   
#   # TODO: find a way to turn off warnings and other information from lubridate  
#   BeginMinusOne = EarnPeriodStart - PolicyTerm
#   EndMinusOne = EarnPeriodEnd - PolicyTerm
# 
#   dfRateChanges = dfRateChanges[order(dfRateChanges$RateDate),]
#   
#   EarliestRateLevel = GetEarliestRateLevel(dfRateChanges, BeginMinusOne)
#   
#   dfRateChanges = dfRateChanges[dfRateChanges$RateDate > BeginMinusOne,]
#   dfRateChanges = dfRateChanges[dfRateChanges$RateDate < EarnPeriodEnd,]
#   
#   if (nrow(dfRateChanges) < 1){
#       AverageRateLevel = 1
#   } else{
#     
#     EarnWidthDays = GetEarnWidthDays(EarnPeriodStart, EarnPeriodEnd)
#     EarnArea = GetEarnArea(EarnPeriodStart, EarnPeriodEnd, PolicyTerm)
#     
#     Area = GetAreas(BeginMinusOne, EndMinusOne, EarnPeriodStart, EarnPeriodEnd, EarnArea, EarnWidthDays, dfRateChanges)
#     
#     dfRateChanges$TotalArea = Area
#     
#     n = length(Area)
#     
#     if (n >1) {
#       dfRateChanges$IndividualArea = c(Area[1:(n-1)] - Area[2:n], Area[n])
#     } else {
#       dfRateChanges$IndividualArea = Area
#     }
#     
#     dfRateChanges$IndividualArea = dfRateChanges$IndividualArea / EarnArea
#     AverageRateLevel = with (dfRateChanges, sum(IndividualArea * CumulativeRateLevels))
#     EarliestArea = 1 - sum(dfRateChanges$IndividualArea)
#     AverageRateLevel = AverageRateLevel + EarliestRateLevel * EarliestArea  
#   }
#   
#   return (AverageRateLevel)
#   
# }