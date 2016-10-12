# https://github.com/haven-jeon/korea_real_estate_analysis/blob/master/realestate_article_init_blog.Rmd
setwd("D:/git/github/r/real_estate")
#웹 데이터 수집과 저장을 위한 패키지
library(rvest) 
#rvest를 구성하는 저수준 API를 저장하고 있으며 
#rvest에 대한 자세한 핸들링을 하기 위해 사용한다. 
library(httr)  
#문자열 처리에 대한 패키지로 
library(stringi)
#국토교통부에서 원 데이터를 엑셀로 제공하기 때문에 
#엑셀 데이터를 읽어들이기 위해서 필요함 
library(XLConnect)
# data.frame보다 편리하고 효율적인 테이블 핸들링 패키지 
library(data.table)
library(dplyr)

# 수집한 매매 데이터 로딩 
load('result_sales_dt.RData')
glimpse(result_sales_dt, width=60)
qrt_cnts <- result_sales_dt[yyyyqrt != '2015Q2',.N,yyyyqrt] 
library(ggplot2)
ggplot(qrt_cnts, aes(x=yyyyqrt, y=N,group=1)) + 
  geom_line() + xlab("년도분기") + ylab("매매건수") + 
  theme(axis.text.x=element_text(angle=90)) + stat_smooth(method='lm')

localeToCharset()

#group by 절에 region을 추가해서 쿼터별 지역별 매매량을 계산하게 함 
#region_cnts <- result_sales_dt[yyyyqrt != '2015Q2' && region == '서울',.N,.(yyyyqrt,region)]


#지면 여건상 ` theme(axis.text.x = element_blank())`로 X 레이블을 제거했다. 
ggplot(region_cnts, aes(yyyyqrt, N,group=region)) + 
  geom_line() + facet_wrap(~region,scale='free_y', ncol=3) + stat_smooth(method = 'lm') + 
  theme(axis.text.x = element_blank()) 

region_cnts <- result_sales_dt[grep("서울",region),.N,.(yyyyqrt,region,si_gun_gu)]
ggplot(region_cnts, aes(yyyyqrt, N,group=si_gun_gu)) + 
  geom_line() + facet_wrap(~si_gun_gu,scale='free_y', ncol=3) + stat_smooth(method = 'lm') + 
  theme(axis.text.x = element_blank()) 


region_cnts <- result_sales_dt[grep("서울",region),.N,.(yyyyqrt,region,si_gun_gu)]

setDT(region_cnts)[, paste0("type", 1:4) := tstrsplit(region_cnts$si_gun_gu," ")]

region_cnts <- region_cnts[grep("강남구",type3),]

region_cnts

ggplot(region_cnts, aes(yyyyqrt, N,group=type1)) + 
  geom_line() + facet_wrap(~type4,scale='free_y', ncol=3) + stat_smooth(method = 'lm')  
  
  #theme(axis.text.x = element_blank()) 

region_cnts

# http://stackoverflow.com/questions/4350440/split-a-column-of-a-data-frame-to-multiple-columns
#setDT(df)[, paste0("type", 1:4) := tstrsplit(df$si_gun_gu," ")]


#월별 지역별 매매량
region_cnts <- result_sales_dt[,.N,.(yyyymm,region)]

#대표지역 추출
regions <- unique(region_cnts$region)
regions
library(randtests)
runs_p <- c()


for(reg in regions){
  runs_p <- c(runs_p, runs.test(region_cnts[region %chin% reg,N])$p.value)
}


ggplot(data.table(regions, runs_p), aes(x=regions, y=runs_p, group=1)) + 
  geom_line() + geom_point() + 
  ylab('P-value') + xlab('지역')

#####################서울 년도별 추이 ###############
seoul_cnts <- result_sales_dt[yyyymm != '201504' & region %chin% '서울',.N,.(yyyymm)]
seoul_cnts
tot_ts <- ts(seoul_cnts$N,start = c(2006,1), frequency = 12)

plot(stl(tot_ts,s.window = 'periodic'))

library(forecast)
arima_mdl <- auto.arima(tot_ts)

tsdiag(arima_mdl)
#아래 명령어로 정확도등 다양한 지표가 확인 가능하다. 
accuracy(arima_mdl)
plot(forecast(arima_mdl,h=20))
####################################


####################################
#type3 --> 강남구
setDT(result_sales_dt)[, paste0("type", 1:4) := tstrsplit(result_sales_dt$si_gun_gu," ")]


seoul_cnts <- result_sales_dt[yyyymm != '201504' & region %chin% '서울' ,.N,.(yyyymm)]

#type3 --> 강남구
seoul_cnts <- result_sales_dt[yyyymm != '201504' & region %chin% '서울' & type3 %chin% '강남구',.N,.(yyyymm)]
tot_ts <- ts(seoul_cnts$N,start = c(2006,1), frequency = 12)

plot(stl(tot_ts,s.window = 'periodic'))

library(forecast)
arima_mdl <- auto.arima(tot_ts)

tsdiag(arima_mdl)
#아래 명령어로 정확도등 다양한 지표가 확인 가능하다. 
accuracy(arima_mdl)
plot(forecast(arima_mdl,h=20))
####################################







