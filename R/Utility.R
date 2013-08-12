DayDifference = function(StartDate, EndDate)
{
  require(lubridate)
  # Convenience function. This logic will work even if the difference is zero days.
  # Using days(StartDate, EndDate) will produce an error if StartDate == EndDate
  dayDiff = suppressMessages(interval(StartDate, EndDate) / days(1))
  dayDiff
}
