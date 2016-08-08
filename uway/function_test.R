
format(Sys.time(), "%a %b %d %X %Y %Z")

## time to sub-second accuracy (if supported by the OS)
format(Sys.time(), "%H:%M:%OS3")


time_stamp <- function(times){
  dates <- c("02/27/92", "02/27/92")
  x <- paste(dates, times)
  # http://stat.ethz.ch/R-manual/R-devel/library/base/html/strptime.html
  z = strptime(x, "%m/%d/%y %H:%M:%S")
  as.double(z)
  
}

times <- c("09:00:00", "09:00:06")

time_stamp(times)
