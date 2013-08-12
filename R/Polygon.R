GetPolygons = function(df)
{
  require(PBSmapping)
  
  polys = list()
  for (i in 1:(nrow(df)-1)){
    X = c(df$X1[i], df$X2[i+1], df$X3[i+1], df$X4[i])
    Y = c(0, 0, 1, 1)
    polys[[i]] = data.frame(PID=rep(1,4), POS = 1:4, X=X, Y=Y)  
  }
  
  polys
}

PlotPolygons = function(polys, add = FALSE)
{
  require(PBSmapping)
  
  x = sapply(polys, function(y) y$X)
  if (!add) plot(1,1, ylim=c(0,1), xlim=c(0,max(x)), t="n", xlab="", ylab="")
  lapply(polys, function(x){
    polygon(x$X, x$Y)
  })
  NULL
}
