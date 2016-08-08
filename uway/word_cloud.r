
require(wordcloud)
require(RColorBrewer)
data<-read.csv("http://monitor.uway.com/test/access_1000.log",sep=" " , header=F)

library(KoNLP)
library(RColorBrewer)
library(wordcloud)

setwd("d:/data/project/r/uway")
getwd()
f <- file("test.txt", blocking=F)
txtLines <- readLines(f)
nouns <- sapply(txtLines, extractNoun, USE.NAMES=F)
close(f)

wordcount <- table(unlist(nouns))
pal <- brewer.pal(12,"Set3")
pal <- pal[-c(1:2)]
wordcloud(names(wordcount),freq=wordcount,scale=c(6,0.3),min.freq=25,
          random.order=T,rot.per=.1,colors=pal)
dev.off()