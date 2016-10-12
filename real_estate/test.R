# http://win100.tistory.com/170

year <- rep(2008:2010, each=4)            # 2008년~2010년까지 각각 4번씩 반복한 값을 저장



quarter <- rep(1:4, 3)                            # 위와 비슷함

cpi <- c(162.2, 164.6, 166.5, 166.0, 166.2, 167.0, 168.6, 169.5, 171.0, 172.1, 173.3, 174.0) 
# 변수에 수치 입력


plot(cpi, xaxt="n", ylab="CPI", xlab="")            # cpi 를 y축에 넣음, x축의 값을 제거, y축 이름, x축 이름

axis(1, labels=paste(year,quarter,sep="Q"), at=1:12, las=3)        # 축번호, 라벨 이름들, 텍스트를 수직으로 만들어줌(las) 

library(scatterplot3d)                # 패키지 로딩하기

s3d <- scatterplot3d(year, quarter, cpi, highlight.3d=T, type="h", lab=c(2,3))            


##모델을 사용해서 예측해보기

data2011 <- data.frame(year=2011, quarter=1:4)            # 정보를 data.frame 형식에 담기
data2011

fit <- lm(cpi ~ year + quarter)
fit
attributes(fit)
fit$coefficients
residuals(fit)

cpi2011 <- predict(fit, newdata=data2011)                    # predict 함수를 이용해 다음해인 2011년 회귀의 결과 예측하기 

style <- c(rep(1,12), rep(2,4))                                    # 1을 12번 , 2을 4번 있는 벡터

plot(c(cpi, cpi2011), xaxt="n", ylab="CPI", xlab="", pch=style, col=style)        # 그래프 그리기, 

axis(1, at=1:16, las=3, labels=c(paste(year,quarter,sep="Q"), "2011Q1", "2011Q2", "2011Q3", "2011Q4"))    # 축에 그려넣기

?c

library(mboost)
data("bodyfat", package = "TH.data")
myFormula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth       
bodyfat.glm <- glm(myFormula, family = gaussian("log"), data = bodyfat)       
summary(bodyfat.glm)
pred <- predict(bodyfat.glm, type="response")    
plot(bodyfat$DEXfat, pred, xlab="Observed Values", ylab="Predicted Values")    
abline(a=0, b=1) 
str(bodyfat)


#########################
library(mboost)
data("bodyfat", package = "TH.data")
dim(bodyfat)

attributes(bodyfat)

bodyfat[1:5,]

set.seed(123)





