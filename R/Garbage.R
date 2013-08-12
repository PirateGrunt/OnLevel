# dfRateChangeLines = RateChangeLines(dfWerner)
# 
# ggplot() + 
#   geom_rect(data = dfAccidentPeriods, aes(xmin = APStart, xmax = APEnd, ymin = 0, ymax = 1)) + 
#   geom_line(data = dfRateChangeLines, aes(x = x, y = y, group = Group), linetype = 2, color = "white")
# 
# library(PBSmapping)
# 
# p1 <- data.frame(PID=rep(1, 4), POS=1:4, X=c(1,1,6,6), Y=c(1,3,3,1))
# p2 <- data.frame(PID=rep(2, 5), POS=1:5, X=c(4,4,8,8,6), Y=c(2,4,4,2,1))
# p3 <- joinPolys(p1,p2)
# calcArea(p1)
# calcArea(p2)
# calcArea(p3)
# plot(1,1,ylim=c(0,5),xlim=c(0,9), t="n", xlab="", ylab="")
# polygon(p1$X, p1$Y)
# polygon(p2$X, p2$Y)
# polygon(p3$X, p3$Y, col=rgb(0,0,1,0.2))
# 
# 
# # RateChangeLines2 = function(df, policyLength = years(1))
# # {
# #   require(lubridate)
# #   df$ExpirationDate = df$EffectiveDate + policyLength - days(1)
# #   
# #   df$Group = 1:nrow(df)
# #   
# #   mdf = melt(df[,c("EffectiveDate", "ExpirationDate", "Group")], id.vars = "Group")
# #   colnames(mdf) = c("Group", "variable", "x")
# #   mdf$y = ifelse(mdf$variable == "EffectiveDate", 0, 1)
# #   mdf
# # }
# 
# RateChangePeriods = function(df, policyLength = years(1))
# {
#   require(lubridate)
#   tz(df$EffectiveDate) = tz(now())
#   df$ExpirationDate = df$EffectiveDate + policyLength - days(1)
#   tz(df$ExpirationDate) = tz(df$EffectiveDate)
#   
#   df$Group = 1:nrow(df)
#   
#   dfOut = data.frame(Group = c(1,1), x = c(df$EffectiveDate[1], df$ExpirationDate[1]), y = c(0,1))
#   for (i in 2:nrow(df)){
#     dfOut = rbind(dfOut, data.frame(Group = c(i,i), x = c(df$EffectiveDate[i], df$ExpirationDate[i]), y = c(0,1)))
#   }
#   dfOut
# }
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
