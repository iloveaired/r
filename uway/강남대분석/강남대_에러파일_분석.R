library("data.table")
library("stringr")
library("plyr")
#####################################
url = "http://repo.uway.com/~aired/log/error_20131101.log"
access_log<-read.csv(url,sep=":" , header=F)
#           V1            V2
# 1	[Mon Oct 07 15	 
# 2	[Mon Oct 07 15	 Jan 28 2012 11
# 3	[Mon Oct 07 15	 Created child process 6528


dt = data.table(access_log$V1, access_log$V4 )
dt = data.table(count(dt, "V1"))

#dt = dt[V1  %like% "Fri Nov 01"]

setkey(dt, freq)
dt
# 340:                            [Fri Nov 01 10    56
# 341:                            [Fri Nov 01 15   289
# 342: Cannot initialize zend_mm storage [win32]   564

#dt = data.table(d = access_log$V1, msg = access_log$V4 )
dt = data.table(access_log)
# http://goo.gl/IkQK1z
#dt = dt[V1  %like% "Fri Nov 01 " & V4 %like% "winnt_accept"]
dt = dt[ V4 %like% "winnt_accept"]
dt
count(dt, "V1")




dt = data.table(access_log)
dt = dt[V1  %like% "win32"]
dt

dt[d  %like% "win32"]



################################################
url = "http://repo.uway.com/~aired/log/admission.kangnam.ac.kr-115-error_log_log_20131117"
access_log<-read.csv(url,sep=" " , header=F)
table(access_log[,13])


dt = data.table(count(access_log, c("V13")))
setkey(dt, freq)
dt


dt = data.table(count(access_log, c("V9")))
setkey(dt, freq)
dt
# V9 freq
# 1: (20024)The    1
# 2:       file    1
# 3:              58
# 4:     script   58
# 5:       File 4206

#  "script"  만 필터링 
dt = data.table(access_log)
dt = dt[which(V9 == "script")]
dt

