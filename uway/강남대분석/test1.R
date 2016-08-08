set.seed(1)
d <- data.frame(year = rep(2000:2002, each = 3), count = round(runif(9, 0, 20)))
d
library(plyr)
ddply(d, "year", function(x) {
  mean.count <- mean(x$count)
  sd.count <- sd(x$count)
  cv <- sd.count/mean.count
  data.frame(cv.count = cv)
})
ddply(d, "year", summarise, mean.count = mean(count))
ddply(d, "year", transform, total.count = sum(count))

#######################
df <- data.frame(x = rnorm(5000), y = rnorm(5000))
df
library(ggplot2)
h <- ggplot(df, aes(x,y))

h + geom_point(alpha = 0.5)
h + geom_point(alpha = 1/10)

access_log<-read.csv("http://repo.uway.com/~aired/access.log",sep=" " , header=F)

d = data.table(access_log[1:10,]) 
#IP,TIME
access_log[1:2, c("V1","V4")]

access_log[1:2,c("V1")]
s = sapply(access_log[,4], function(x) { str_split(x, "\\?")[[1]][1]})

count
