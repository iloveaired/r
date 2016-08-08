# Apache log
#$V1 : 123.141.218.226
#$V4 : [01/Nov/2013:09:00:00  
#$V6 : GET /img/main/tab01_on.png HTTP/1.1
#$V7 : 200(리턴 코드)
#$V8 : 101011(size)
#$V9 : http://admission.kangnam.ac.kr/guide/qna.htm?bbsid=qna&ctg_cd=susi1   
#$10 : Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)

data<-read.csv("http://repo.uway.com/~aired/test/access.log",sep=" " , header=F)

#a = "09:00:00"
#ts = substr(data[1:100,]$V4, 14,21)

#a = "09:00"
#ts = substr(data$V4, 14,18)
#a = "09:0"
ts = substr(data$V4, 14,17)

#a = "09"
ts = substr(data$V4, 14,16)


t = table(ts)
plot(t)
summary(plot(t))
