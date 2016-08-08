data<-read.csv("http://monitor.uway.com/test/access_1000.log",sep=" " , header=F)
#data<-read.csv("http://ids01.uwayapply.com/test/ids.uwayapply.com-101-ssl_access_log_2013090322",sep=" " , header=F)

#referer<-data$V9[1:10]
referer<-data$V9
row<-NULL
row2<-NULL
for(i in 1:length(referer)){
  l = as.character(referer[i])  
  r<-url_parse(l)    
  row<-c(row, r[[1]])   # append "http:https"
  row2<-c(row2, r[[2]])    
}

#print(raw)
#raw Freq
#1 http  103
print(table(row))
print(as.data.frame(table(row)))
print(as.data.frame(table(row2)))

