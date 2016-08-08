# DataTypes(31:06)
x<-"..."
x<-c(1,2)
y<-c(1.7, "a")
attributes(y)
m<-matrix(1:6,2,3)
m
dim(m)
m<- 1:10
m
dim(m) <- c(2,5)
m
# cbind, rbind

#factors
x<-factor(c("yes", "yes", "no"))
x
table(x)
#Data frame : tabular data
# read.table(), read.csv()
# converted to a matrix by data.matrix()
# matrix--> same class, but data frame 은 컬럼별로 다를수 있다.
x<-data.frame(foo= 1:3, ....)


x<- 1:3
names(x)
names(x)<- c("foo", "bar", "norf")
names(x)

# List can also have names
x<- list(a=1,b=2,c=3)
x

#
m<-matrix(1:4 , 2,2)
dimnames(m) <- list(c("a","b"), c("c","d"))
m

# Data types
#  atomic classes : numeric,logic, character, integer, complex
#  vectors, lists
#  factors
#  missing values
#  data frames
#  names

########################################
####### Subsettiing 17:20 ##############
########################################

x<-c("a","b", "c","d")
x[1]
x[1:3]
x[x>"a"]
u <- x > "a"
u
x[u]

x<-matrix(1:6, 2,3)
x[2,1]
# subsetting lists

x<-list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]

x<- c(1,2, NA,4)
x
x[!is.na(x)]

###
good <- complete.cases(xxx)

str(.Platform)
version

n <- 1:4
n
r <- lapply(n, runif, min=0, max=10)
r
x<-list(rnorm(100), runif(100))
x
sapply(x, quantile,prob =c(0.25,0.75))
x

str(apply)
x<-c(rnorm(10), runif(10), rnorm(10,1))
f<-gl(3,10)
split(x,f)

library(datasets)
head(airquality)
s<-split(airquality, airquality$Month)
s
sapply(s, function(x) colMeans(x[, c("Ozone", "Wind")], na.rm=TRUE))

split(x,f)
f<-gl(c(5,6,7,8,9),25)

log(-1)
mean(xx)
traceback()
########################################
####### 3주차##############
########################################
# Simulation
x<-rnorm(10)
x
x<-rnorm(10,20,2)
x
summary(x)

set.seed(10)
x<-rnorm(100)
#x<-rbinom(100,1,0.5)
e<-rnorm(100,0,2)
y <- 0.5 +2 *x +e
summary(y)
plot(x,y)
x<-rnorm(100)
hist(x)
y<-rnorm(100)
plot(x,y)
pchShow()
#############
library(lattice)
library(nlme)
o<-Orthodont
o
xyplot(o$distance ~ o$age | o$Subject, data=o, type="b")

########## custom function 
x <- rnorm(100)
y <- x + rnorm(100, sd = 0.5)
f <- gl(2, 50, labels = c("Group1", "Group2"))
xyplot(y ~ x | f)
########
xyplot(y ~x | f, panel = function(x, y, ...){
                         panel.xyplot(x, y, ...)
                         panel.abline(h = median(y),
                                      lty = 2)
                         })

p<-function(x, y, ...){
  panel.xyplot(x, y, ...)
  panel.abline(h = median(y), lty = 2)
}
xyplot(y ~ x | f, panel = p)
##################

### Lattice Graphics Plotting Demo(21:23)

library(lattice)
package ? lattice
library(help=lattice)
?environmental
data(environmental)
head(environmental)

xyplot(ozone ~ radiation, data=environmental
       , main="Ozone vs Radiation")
xyplot(ozone ~ temperature, data=environmental)
summary(environmental$temperature)

temp.cut <- equal.count(environmental$temperature, 4)
temp.cut
xyplot(ozone ~radiation | temp.cut, data=environmental)
xyplot(ozone ~radiation | temp.cut, data=environmental, layout=c(1,4))
xyplot(ozone ~radiation | temp.cut, 
       data=environmental, as.table=TRUE,pch=20,
                  panel = function(x,y,...){
                    panel.xyplot(x,y,...)
                    fit <- lm(y~x)
                    panel.abline(fit, lmd=2)                    
                  })
                    
xyplot(ozone ~radiation | temp.cut, 
       data=environmental, as.table=TRUE,pch=20,
       panel = function(x,y,...){
         panel.xyplot(x,y,...)        
         panel.loess(x,y)
         
       }, xlab="Solar Radiation", ylab="Ozone(ppb",
        main="Ozone vs SOlar Radiation")
##############
wind.cut <- equal.count(environmental$wind, 4)
                    
wind.cut

xyplot(ozone ~radiation | temp.cut * wind.cut, 
       data=environmental, as.table=TRUE,pch=20,
       panel = function(x,y,...){
         panel.xyplot(x,y,...)        
         panel.loess(x,y)
         
       }, xlab="Solar Radiation", ylab="Ozone(ppb",
       main="Ozone vs SOlar Radiation")
########
splom(~ environmental)
histogram(~ozone , data = environmental)
histogram(~ozone | wind.cut , data = environmental)
histogram(~ozone | temp.cut * wind.cut , data = environmental)

####### Plotting with ggplot2 part1 (24:18)
library(ggplot2)
str(mpg)
################# 4weeks #################



