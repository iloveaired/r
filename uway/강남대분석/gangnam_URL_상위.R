require("data.table")
require("stringr")
require("plyr")
access_log<-read.csv("http://repo.uway.com/~aired/access.log",sep=" " , header=F)
s = sapply(access_log[,9], function(x) { str_split(x, "\\?")[[1]][1]})
dtt = data.table(count(data.table(s),c("s")))

# SORTING by freq

setkey(dtt, freq)
dtt
# 34:                     http://admission.kangnam.ac.kr/ipsi/yogang.htm  530
# 35:                     http://admission.kangnam.ac.kr/ipsi/search.htm 1674
# 36:                                    http://admission.kangnam.ac.kr/ 1704
# s freq
#################################################################################