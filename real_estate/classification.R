# https://goo.gl/76IyaJ
setwd("D:/git/github/r/real_estate")
install.packages(c("party", "rpart", "randomForest"))
library(party)
str(iris)
head(iris)
class(iris)
ind <- sample(1:2,nrow(iris), replace=TRUE, prob=c(0.7,0.3))

#split test, train set
trainData<-iris[ind==1,]
testData<-iris[ind==2,]

#variable relation
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width

iris_ctree<-ctree(myFormula,data=trainData)
trainData

table(predict(iris_ctree),trainData$Species)

predict(iris_ctree)


print(iris_ctree)
plot(iris_ctree)

plot(iris_ctree,type="simple")
testPred <- predict(iris_ctree, newdata=testData)

table(testPred, testData$Species)


#########################
library(mboost)
data("bodyfat", package = "TH.data")
dim(bodyfat)

attributes(bodyfat)

bodyfat[1:5,]

set.seed(123)

ind <- sample(2, nrow(bodyfat), replace=TRUE, prob=c(0.7,0.3))
bodyfat.train<-bodyfat[ind==1,]
bodyfat.test<-bodyfat[ind==2,]


library(rpart)

myFormula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth

bodyfat_rpart <- rpart(myFormula, data=bodyfat.train,
                       control=rpart.control(minsplit=10))

plot(bodyfat_rpart)

text(bodyfat_rpart,use.n=TRUE)

######################### Random Forest
ind<-sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3))

trainData<-iris[ind==1,]

testData<-iris[ind==2,]


library(randomForest)

rf<-randomForest(Species~.,data=trainData,ntree=100,proximity=TRUE)

table(predict(rf),trainData$Species)

table(iris$Species)
table(iris)

table(c(162.2, 164.6), c(1,2))

attributes(rf)

(rf$err.rate)

plot(rf)

importance(rf)

varImpPlot(rf)

irisPred <- predict(rf, newdata = testData)

table(irisPred, testData$Species)

plot(margin(rf, trainData$Species))

