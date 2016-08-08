# Apache log
#$V1 : 123.141.218.226
#$V4 : [01/Nov/2013:09:00:00  
#$V6 : GET /img/main/tab01_on.png HTTP/1.1
#$V7 : 200(리턴 코드)
#$V8 : 101011(size)
#$V9 : http://admission.kangnam.ac.kr/guide/qna.htm?bbsid=qna&ctg_cd=susi1   
#$10 : Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)

# group by 예제 : http://goo.gl/tsx20s
library(plyr)
#  
dt <- data.frame(age=rchisq(20,10),group=sample(1:2,20,rep=T))

ddply(dt,~group,summarise,mean=mean(age),sd=sd(age))

field_num = 7
#####
# > field_num = 7
# > table(access_log[,field_num]) # Gives a nice text break down of HTTP codes served.
# 
# 200  206  301  304  404 
# 2148   31    8 3089   73 
access_log<-read.csv("http://repo.uway.com/~aired/access.log",sep=" " , header=F)
table(access_log[,field_num]) # Gives a nice text break down of HTTP codes served.
barplot(table(access_log[,field_num])) # Gives a nice bar plot visual of the HTTP codes served.
#######
# > d = access_log[1:2,9]
# > d
# [1] http://admission.kangnam.ac.kr/                                                                                   
#   [2] http://admission.kangnam.ac.kr/guide/qna.htm?bbsid=qna&ctg_cd=susi1&page=1&skey=&keyword=&mode=view&bltn_seq=27124
# 281 Levels: - ... http://www.kangnam.ac.kr/

urls = access_log[1:2,9]


t = table(access_log[,9])



library(stringr)
url = c("http://admission.kangnam.ac.kr/guide/qna.htm?bbsid=qna&ctg_cd=susi1&page=1&skey=&keyword=&mode=view&bltn_seq=27124")
url = c("http://admission.kangnam.ac.kr/guide/")
vec =   str_split(url, "\\?")[[1]][1]


# [5316] "http://admission.kangnam.ac.kr/guide/qna.htm"                      
# [5317] "http://admission.kangnam.ac.kr/guide/qna.htm"                      
# [5318] "http://admission.kangnam.ac.kr/"                                   
# [5319] "http://admission.kangnam.ac.kr/"                                   
# [5320] "http://admission.kangnam.ac.kr/"                                   
# [5321] "http://admission.kangnam.ac.kr/"                                   
# [5322] "http://admissi
# ? 앞까지만 리턴 
s = sapply(access_log[,9], function(x) { str_split(x, "\\?")[[1]][1]})
dtt = data.table(count(data.table(s),c("s")))
setkey(dtt, freq)
dtt
# 34:                     http://admission.kangnam.ac.kr/ipsi/yogang.htm  530
# 35:                     http://admission.kangnam.ac.kr/ipsi/search.htm 1674
# 36:                                    http://admission.kangnam.ac.kr/ 1704
# s freq
##############################
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
#################

########################

count(access_log,"V7")

#dt[which(freq > 1)] 
# 200으로 필터링
dt = data.table(access_log)
dt = dt[which(V7 == "200")]
plot(table(my_ext(dt$V6)))


count(access_log,"V7")



v = access_log[1:100,6]
v

#plot(table(substr(v, ,16)))
# INPUT  : GET /ipsi/dataroom.htm?ctg_cd=susi1
# OUTPUT : /ipsi/dataroom.htm
my_path <- function (v){
  sapply(v, function(x) {
    tmp = str_split(x, " ")[[1]][2]
    str_split(tmp, "\\?")[[1]][1]
  })
}


my_path(v)

my_ext <- function(v) {  
  sapply(v, function(x) {
    tmp = str_split(x, " ")[[1]][2]
    tmp2 = str_split(tmp, "\\?")[[1]][1]
    str_split(tmp2, "\\.")[[1]][2]
  })
}

v = access_log[1:10,6]
my_ext(access_log[,6])
plot(table(my_ext(access_log[,6])))

#GET /img/common/r_bn/b01.jpg HTTP/1.1



