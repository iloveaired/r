library(KoNLP)
require(wordcloud)
require(RColorBrewer)

library(sqldf)
library(stringr)

my_timestamp <- function(times){
  dates <- c("02/27/92", "02/27/92")
  x <- paste(dates, times)
  # http://stat.ethz.ch/R-manual/R-devel/library/base/html/strptime.html
  z = strptime(x, "%m/%d/%y %H:%M:%S")
  as.double(z)
  
}
#library("D:\\data\\project\\r\\uway\\myfunc.R")


data<-read.csv("http://repo.uway.com/~aired/access.log",sep=" " , header=F)

# rows, cols
#x<-data[1:10,c(1,4,6,7)] 

#z=time_stamp(substr(data[1:100,]$V4, 14,21))

#a = "09:00:00"
#ts = substr(data[1:100,]$V4, 14,21)

#a = "09:00"
#ts = substr(data[1:100,]$V4, 14,18)
#a = "09:0"
ts = substr(data$V4, 14,17)

t = table(ts)
plot(t)





#http://www.statmethods.net/input/dates.html

#$V1 : IP,  $V4:TIME $V6:GET   $V7 : 200, 
###### IP 접속 건수 (접속건수 별구간..) ######
cols <-data$V1

cell.freq = table(cols)

#cell.freq.max = max(cell.freq)

r = range(cell.freq)
breaks = seq(r[1], r[2], by=5)

c.cut = cut(cell.freq, breaks, right=FALSE)
c.cut
c.freq = table(c.cut)
c.freq
cbind(c.freq)

plot(c.freq)
# 
names(which(cell.freq > 30))

##############################################





