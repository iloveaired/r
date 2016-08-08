include(myfunc.R)

data<-read.csv("http://monitor.uway.com/test/access_1000.log",sep=" " , header=F)
#data<-read.csv("http://ids01.uwayapply.com/test/ids.uwayapply.com-101-ssl_access_log_2013090322",sep=" " , header=F)

library(sqldf)
head(sqldf('select * from data limit 1'))


head(data)
#substr(data$V6,1,3)

substr(data$V4, 2,12)

referer<-data$V9[2:12]
raw<-NULL
for(i in 1:length(referer)){
  l = as.character(referer[i])
  
  r<-fn_parse(l)
  #print(r)
  
  raw<-c(raw, r[[1]])   # append "http:https"
}

#print(raw)
#raw Freq
#1 http  103
print(as.data.frame(table(raw)))
#print(raw)
#rm(raw)
