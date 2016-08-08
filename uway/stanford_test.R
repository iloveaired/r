install.packages('xlsx')
install.packages('foreign')
install.packages('foreach')
install.packages('multicore')
install.packages('XML')
install.packages('reshape')
install.packages('sqldf')

library(sqldf)
data<-read.csv("http://monitor.uway.com/test/access_1000.log",sep=" " , header=F)
head(sqldf('select * from data limit 1'))
install.packages("DBI")
install.packages('RMySQL',type="source")

#require('RMySQL')

#library(RMySQL)

head(cars)
cars
plot(cars$speed, cars$dist)

# SAVE
setwd("D:\\data\\project\\r\\uway")
pdf(file='tmp/save.pdf', height=7, width=7)
plot(cars$speed, cars$dist)
dev.off()

#linear regression
plot(cars$speed, cars$dist)
fit <-lm(cars$dist ~ cars$speed)
abline(fit,col='red')
summary(fit)

# http://bioconductor.org/install/
#source("http://bioconductor.org/biocLite.R")
#biocLite()
#pkgs <- rownames(installed.packages())
#biocLite(pkgs)



#bioDist...
source("http://bioconductor.org/biocLite.R")
biocLite("bioDist")
citation("bioDist")
library(bioDist)
d <- cor.dist(t(e))
############
hn<-hist(Nile)
print(hn)
str(hn)
############
d<-data.frame(list(kids=c("jack","jill"), ages=c(12,10)))
d
view(d)
search()
############
charplot<- function(x,y,pc=16,co="red"){
  plot(y~x, pch=pc, col=co)
}
charplot(1:10,1:10, 17)
charplot(1:10,1:10, co="navy")

############
many.means<-function(...){
  data<-list(...)
  
}
debug(charplot)
charplot(1:10,1:10, 17)
######### rattle
install.packages("rattle", repos="http://rattle.togaware.com")
#start
library("rattle")
rattle()
#####


search()

ds<- new.env()



