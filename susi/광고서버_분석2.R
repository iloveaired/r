require("data.table")
require("stringr")
require("plyr")
require("ggplot2")
library(lattice)
# Apache log
setwd("D:\\lang\\r\\susi")

data11<-read.csv("http://211.115.113.211/11.adstream.02.log",sep="^" , header=F)




data_table<-data.table(time=data11$V2, ip=data11$V4)

t <- sqldf('select ip, count(*) as c from data_table group by ip having count(*) < 1000')

quantile(t$c)

head(t)
summary(t$c)
hist(t$c)
plot(t$c)


rowSums (t, na.rm = FALSE, dims = 2)

summary(t)
plot(t$ip, ylim=c(0,100))
plot(t$ip)

