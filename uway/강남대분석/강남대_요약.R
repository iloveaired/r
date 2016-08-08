require("data.table")
require("stringr")
require("plyr")
# Apache log
#$V1 : 123.141.218.226
#$V4 : [01/Nov/2013:09:00:00  
#$V6 : GET /img/main/tab01_on.png HTTP/1.1
#$V7 : 200(리턴 코드)
#$V8 : 101011(size)
#$V9 : http://admission.kangnam.ac.kr/guide/qna.htm?bbsid=qna&ctg_cd=susi1   
#$10 : Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)

url = "http://repo.uway.com/~aired/access.log"
#url = "http://repo.uway.com/~aired/log/1117_mod100"
access_log<-read.csv(url,sep=" " , header=F)
########################### 상위 접속 URL #######################################
s = sapply(access_log[,9], function(x) { str_split(x, "\\?")[[1]][1]})
dtt = data.table(count(data.table(s),c("s")))

# SORTING by freq

setkey(dtt, freq)
dtt
# 34:                     http://admission.kangnam.ac.kr/ipsi/yogang.htm  530
# 35:                     http://admission.kangnam.ac.kr/ipsi/search.htm 1674
# 36:                                    http://admission.kangnam.ac.kr/ 1704
# s freq
##############################시간별 접속 건수  #################################
#a = "09:00:00"
#ts = substr(data[1:100,]$V4, 14,21)
#a = "09:00"
#ts = substr(data$V4, 14,18)
#a = "09:0"
plot(table(substr(access_log$V4, 14,16)))
############################## IP 상위 리스트   #################################

dt = data.table(count(access_log, "V1"))
setkey(dt, freq)
dt

#dt = dt[which(freq > 1)] # 30접속보다 큰것만
##setkey(dt, freq)
#dt
plot(count(dt, "freq"))
############################  RESPONSE CODE별 개수 ##############################
# V7 freq
# 1 200 2148
# 2 206   31
# 3 301    8
# 4 304 3089
# 5 404   73
count(access_log,"V7")
############################



