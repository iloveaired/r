#data<-read.csv("http://monitor.uway.com/test/access_1000.log",sep=" " , header=F)
#data<-read.csv("http://ids01.uwayapply.com/test/ids.uwayapply.com-101-ssl_access_log_2013090322",sep=" " , header=F)
setwd("D:\\data\\project\\r\\uway")
data<-read.table("access_log.txt")
data2<-data[1:3]
#referer<-data$V9[1:10]
#print(table(data$V7))

#print(table(data$V1))

