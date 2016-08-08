# Apache log
#$V1 : 123.141.218.226
#$V4 : [01/Nov/2013:09:00:00  
#$V6 : GET /img/main/tab01_on.png HTTP/1.1
#$V7 : 200(리턴 코드)
#$V8 : 101011(size)
#$V9 : http://admission.kangnam.ac.kr/guide/qna.htm?bbsid=qna&ctg_cd=susi1   
#$10 : Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)
library("data.table")
library("data.table")
library("stringr")
library("plyr")

data<-read.csv("http://repo.uway.com/~aired/access.log",sep=" " , header=F)

#dt = data.table(data)
#dt[V8 == "8974336"]

######## SIZE plot 그래프 (200인경우만 ##################
n =10000
sample.code = data[1:n,]$V7
sample.size  = as.integer(paste(data[1:n,]$V8))

dt = data.table(sample.code, s = sample.size)
colnames(dt)


#dt = dt[which(sample.code == 200)]

plot(dt[,s])
summary(dt)
#####################################
summary(sample.code)
# http://cran.r-project.org/web/packages/plyr/plyr.pdf
# > df
# sample.code    s
# 1         200  448
# 2         200 5037
# 3         200  142
# 4         200  375
# > count(df,c("sample.code"))
# sample.code freq
# 1         200    4
count(dt,c("sample.code"))



dt1 = dt[,sample.code]

dt1[,sum(sample.code)]

ddply(data,~group,summarise,mean=mean(age),sd=sd(age))

dt <- data.frame(age=rchisq(20,10),group=sample(1:2,20,rep=T))



#### TEST  #######################





sample.code = data[1:n,]$V7
sample.size  = as.integer(paste(data[1:n,]$V8))

t = data.table(code = sample.code, size = sample.size)

t2 = t[which(code == 200)]
summary(t2)

plot(t2)
plot(sample.size)

max_size = as.integer(max(t2$size, na.rm = TRUE))
max_size

breaks = seq(0, max_size, by=1000)

breaks

sample.cut= cut(t2$size, breaks, rigth=FALSE)
sample.cut

#t = table(sample.code, sample.cut)
t =   data.table( sample.cut, sample.code)


setkey(t,"200")
t[which(t$200 == "0")]


cols = colnames(t)

sum(t[,"200"]) == 0
t[,]

colnames(t)
setkey(t,"200")

t[list("200")]

t[]

t





t
y = t[,"(0,1e+03]"]
y = t[,sum("(0,1e+03]")]
y

t


t = table(data$V7, data$V8)
t
plot(t)