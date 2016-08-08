library("data.table")
library("stringr")
library("plyr")

url = "http://repo.uway.com/~aired/log/1117_mod100"

access_log1<-read.csv(url,sep=" " , header=F)
count(access_log1,"V7")
url = "http://repo.uway.com/~aired/log/1120_mod100"
access_log2<-read.csv(url,sep=" " , header=F)

#    V7 freq
# 1 200 3124
# 2 206    3
# 3 304  758
# 4 404   93
count(access_log,"V7")
#pdf("myout.pdf")

pie(table(access_log1[,7]))
pie(table(access_log2[,7]))

#dev.off()

