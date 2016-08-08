require("data.table")
library(sqldf)

require(lattice)
# Apache log
#$V1 : 123.141.218.226
#$V4 : [01/Nov/2013:09:00:00  
#$V6 : GET /img/main/tab01_on.png HTTP/1.1
#$V7 : 200(리턴 코드)
#$V8 : 101011(size)
#$V9 : http://admission.kangnam.ac.kr/guide/qna.htm?bbsid=qna&ctg_cd=susi1   
#$10 : Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)

d1<-read.csv("http://billing01.uwayapply.com/log/npay_result.txt",sep=" " , header=F)
d2<-read.csv("http://billing01.uwayapply.com/log/npay_receive.txt",sep=" " , header=F)

#a = "09:00:00"
#ts = substr(data[1:100,]$V4, 14,21)

#a = "09:00"
#ts = substr(data$V4, 14,18)
#a = "09:0"

t1 <- data.table(time=substr(d1$V4, 14,18))
t2 <- data.table(time =substr(d2$V4, 14,18))

t1 <- sqldf('select time, count(*) as c from t1 group by time')
t2 <- sqldf('select time, count(*) as c from t2 group by time')
ts <- sqldf('select t1.time as time, t1.c as result, t2.c as receive from t1,t2 where t1.time = t2.time')
o = data.table(ts)

plot(ts)


#ts <- sqldf('select time, count(*) as c from t1 group by time')
#summary(t1)

plot(table(substr(d1$V4, 14,18)))
plot(table(substr(d2$V4, 14,18)))


