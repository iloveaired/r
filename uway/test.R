names<-c('a','b')
names
1:10
-2:5
seq(from = 2, to=20,by=7)
rep(names,each=3)
rep(1:4, 3)
rep(1:4, each=3)
?seq
help(seq)
?mtcars


tail(mtcars)
str(mtcars)
summary(mtcars)
m<-mtcars
m[m$mpg>20,c('mpg', 'disp')]

(1:10)^2
sum((1:10)^2)
sum_sqr<-function(x){ sum(x^2) }
sum_sqr(1:10)
fun<-function(x, y){
  out <- x^2
  out <- out + y
  out
}
fun(3,5)
first_name <- 'Young Kwan'
last_name <- 'Lee'
first_name + last_name
'%p%' <- function(x,y){ paste(x, y, sep=' ')}
first_name %p% last_name
install.packages('plyr')
library('plyr')
head(mtcars)
ddply(mtcars,c('cyl'),summarise, max = max(disp), min = min(disp))
?ddply
df1<- data.frame(
  key = c('aaa','bbb','ccc')
  ,field1 = c(3,1,4)
)
df2<- data.frame(
  key = c('aaa','ccc','eee')
  ,field2 = c(2,1,7)
)
df1
df2
merge(df1,df2, by=c('key'))
merge(df1,df2, by=c('key'), all.x = TRUE)
merge(df1,df2, by=c('key'), all = TRUE)
in_vector <- c(11,13,17,19,23)
matmaker_list <- vector('list',length(in_vector))
matmaker_list
list(mtcars, 1,'xyz')
matmaker_list
for (i in 1:length(in_vector)){
  matmaker_list[[i]] <- 0:1
}
matmaker_list
0:1
expand.grid(0:1, 5:7)
combos_matrix <- do.call(expand.grid, matmaker_list)
combos_matrix <- t(combos_matrix)
answer <- in_vector  %*% combos_matrix
answer
?matmult
unique(sort(answer))
in_vector
list.files()
#18
df <- read.csv('xxx.csv')
df$GP <- 1
write.csv(df, 'xxx2.csv')

#19

all_df <- read.cv('xxx.csv')
substr(all_df$Game.ID, 1,8)
write.csv(df)
#as.Date( , '%Y%m%d')
class('1')
as.numeric('1')

as.numberic(sub(':.*','', all_df$xx))

as.numberic(sub('[:.*]0-9]{1,2}','',all_df$xx))
?regex
m





