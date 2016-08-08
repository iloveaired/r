
library(KoNLP)
require(wordcloud)
require(RColorBrewer)

data<-read.csv("http://monitor.uway.com/test/access_1000.log",sep=" " , header=F)
nouns <-data$V1
wordcount <- table(unlist(nouns))

pal <- brewer.pal(12,"Set3")
pal <- pal[-c(1:2)]
wordcloud(names(wordcount),freq=wordcount,scale=c(6,0.3),min.freq=100,
          random.order=T,rot.per=.1,colors=pal)
