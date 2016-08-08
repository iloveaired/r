# Apache log
#$V1 : 123.141.218.226
#$V4 : [01/Nov/2013:09:00:00  
#$V6 : GET /img/main/tab01_on.png HTTP/1.1
#$V7 : 200(리턴 코드)
#$V8 : 101011(size)
#$V9 : http://admission.kangnam.ac.kr/guide/qna.htm?bbsid=qna&ctg_cd=susi1   
#$10 : Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)

library(stringr)

logs<-read.csv("http://repo.uway.com/~aired/test/sample.log",sep=" " , header=F)


colnames(logs)=c('host','ident','authuser','date','time','request','status','bytes','duration')

t = table(logs$status)

plot(t)
attributes(t)
attributes(logs)

msg<-"hello"
attributes(msg)
x<-5
x
x<-1:20
class(x)
x
as.numeric(x)
as.logical(x)
as.character(x)



x<-c(0.5,0.6) ## numeric
x

x<-c(TRUE, FALSE)  ## logical

x<-c("a","b") ## character
x
as.numeric(x)


m<-matrix(1:6, nrow=2, ncol =3)
m


m<-1:10
m
dim(m) <- c(2,5)
m

## Lists : 다른 클래스의 엘리먼트를 가질수 있다.
## vector는  동일클래스만 가능

#### Factors
## ordered, unordered
## lm(), glm() modeling function 에서 사용
x<-factor(c("yes", "yes", "no", "no"))
x
table(x)
unclass(x)

x<-factor(c("yes", "yes", "no", "no"), levels = c("yes", "no"))
x
# is.na() NA
# is.nan() NaN

#Names
x<-1:3
names(x)
names(x)<-c("foo", "bar", "norf")
x

m<-matrix(1:6, nrow=2, ncol =3)
m
dimnames(m)<-list(c("a","b"), c("a","b","c"))
m

#data types
# atomic classses : numeric, logical, character, integer, complex
# verctors, lists
# factors
# missing values
# data frames
# names


################# Subsetting(part1) ###############








