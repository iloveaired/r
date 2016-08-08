# Apache log
#$V1 : 123.141.218.226
#$V4 : [01/Nov/2013:09:00:00  
#$V6 : GET /img/main/tab01_on.png HTTP/1.1
#$V7 : 200(리턴 코드)
#$V8 : 101011(size)
#$V9 : http://admission.kangnam.ac.kr/guide/qna.htm?bbsid=qna&ctg_cd=susi1   
#$10 : Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)
       
url_parse <- function(arg){
  
  vec =   strsplit(arg,"://")
  v1 <- vec[[1]]
  h1<-v1[1]
  h2<-v1[2]
  url<-strsplit(h2,"/")[[1]][1]
  
  return (list(h1,url))
}

my_timestamp <- function(times){
  dates <- c("02/27/92", "02/27/92")
  x <- paste(dates, times)
  # http://stat.ethz.ch/R-manual/R-devel/library/base/html/strptime.html
  z = strptime(x, "%m/%d/%y %H:%M:%S")
  as.double(z)
  
}


