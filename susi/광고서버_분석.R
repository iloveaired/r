require("data.table")
require("stringr")
require("plyr")
require("ggplot2")
library(lattice)
library(sqldf)

# Apache log
setwd("D:\\lang\\r\\susi")
# 9/12  06½Ã
data<-read.csv("http://211.115.113.211/12.adstream.02.log",sep="^" , header=F)


#data<-read.csv("adlog.txt",sep="^" , header=F)

data_table<-data.table(time=data$V2, ip=data$V4)
t <- sqldf('select ip, count(*) as c from data_table group by ip having count(*) < 1000')
head(t)

quantile(t$c)

summary(t$c)
hist(t$c)
plot(t$c)

rowSums(t12, na.rm = FALSE, dims = 1)



plot(t12$ip, ylim=c(0,100))
plot(t12$ip)

