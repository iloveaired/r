setwd("D:/git/github/r/notebook")

library('ggplot2') # visualization
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('mice') # imputation
library('randomForest') # classification algorithm
train <- read.csv('./data/train.csv', header = TRUE)

test  <- read.csv('./data/test.csv', header = TRUE)

test.survived <- data.frame(Survived = rep("None", nrow(test)), test[,])
#test.survived <- data.frame(Survived = rep("None", nrow(test)), test[1,4])

data.combined <- rbind(train, test.survived)
str(data.combined)

data.combined$Survived = as.factor(data.combined$Survived )
data.combined$Pclass = as.factor(data.combined$Pclass )
str(data.combined)

table(data.combined$Survived)
table(data.combined$Pclass)

library(ggplot2)

train$Pclass <- as.factor(train$Pclass)

train$Survived

ggplot(train, aes(x = Pclass, fill = factor(Survived))) +
  #geom_histogram(width = 0.5) +
  geom_bar()+
  xlab("Pclass") +
  ylab("Total Count") +
  labs(fill = "Survived")


head(as.character(train$Name))


length(unique(as.character(data.combined$Name)))

dup.names <- as.character(data.combined[which(duplicated(as.character(data.combined$Name))), "Name"])

which(data.combined$Name %in% dup.names)

data.combined[which(data.combined$Name %in% dup.names),]
library(stringr)
misses<-data.combined[which(str_detect(data.combined$Name, "Miss.")),]
misses[1:5,]

mrses<-data.combined[which(str_detect(data.combined$Name, "Mrs.")),]
mrses[1:5,]


males<-data.combined[which(train$Sex == "male"),]
males[1:5,]


extractTitle<-function(name){
  name <- as.character(name)
  
  if(length(grep("Miss.", name)) > 0){
    return ("Miss.")
  } else if(length(grep("Master.", name)) > 0){
    return ("Master.")
  } else if(length(grep("Mrs.", name)) > 0){
    return ("Mrs.")
  } else if(length(grep("Mr.", name)) > 0){
    return ("Mr.")
  } else {
    return ("Other")
  }
  
}

titles <- NULL
for(i in 1:nrow(data.combined)){
  titles<-c(titles, extractTitle(data.combined[i,"Name"]))
}
data.combined$Title = as.factor(titles)
#data.combined$Title
ggplot(data.combined[1:891,], aes(x = Title, fill = factor(Survived))) +
  geom_bar()+
  facet_wrap(~Pclass) +
  ggtitle("Pclass") +
  xlab("Title") +
  ylab("Total Count") +
  labs(fill = "Survived")

table(data.combined$Sex)

ggplot(data.combined[1:891,], aes(x= Sex, fill = Survived)) +
  geom_bar() +
  facet_wrap(~Pclass) +
  ggtitle("Pclass") +
  xlab("Sex") +
  ylab("Total Count") +
  labs(fill = "Survived")

summary(data.combined$Age)
summary(data.combined[1:891,"Age"])

ggplot(data.combined[1:891,], aes(x= Age, fill = Survived)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~Pclass) +
  ggtitle("Pclass") +
  xlab("Age") +
  ylab("Total Count") +
  labs(fill = "Survived")

ggplot(data.combined[1:891,], aes(x= Age, fill = Survived)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~Sex + Pclass) +
  xlab("Age") +
  ylab("Total Count") +
  labs(fill = "Survived")

which(data.combined$Title == "Master.")

boys <- data.combined[which(data.combined$Title == "Master."),]
summary(boys$Age)

misses <- data.combined[which(data.combined$Title == "Miss."),]
summary(misses$Age)


ggplot(misses[misses$Survived != "None",], aes(x= Age, fill = Survived)) +
  geom_histogram(binwidth = 5) +
  facet_wrap(~Pclass) +
  ggtitle("Age for Miss. by Pclass")
  xlab("Age") +
  ylab("Total Count") +
  labs(fill = "Survived")

#female children may have different survival rate
misses.alone <- misses[which(misses$SibSp == 0 & misses$Parch == 0),]
  
summary(misses.alone$Age)

length(which(misses.alone$Age <= 14.5))
summary(data.combined$SibSp)

# Can we treat as a factor?
length(unique(data.combined$SibSp))
data.combined$SibSp <- as.factor(data.combined$SibSp)
summary(data.combined$SibSp)

ggplot(data.combined[1:891,], aes(x= SibSp, fill = Survived)) +
  #geom_histogram(binwidth = 1) +
  geom_bar() +
  facet_wrap(~Pclass + Title) +
  ggtitle("PClass, Title") +
  xlab("Sibsp") +
  ylab("Total Count") +
  ylim(0,300) +
  labs(fill = "Survived")



data.combined$Parch <- as.factor(data.combined$Parch
                                 )
summary(data.combined$Parch)

ggplot(data.combined[1:891,], aes(x= Parch, fill = Survived)) +
  #geom_histogram(binwidth = 1) +
  geom_bar() +
  facet_wrap(~Pclass + Title) +
  ggtitle("PClass, Title") +
  xlab("Parch") +
  ylab("Total Count") +
  ylim(0,300) +
  labs(fill = "Survived")

temp.Sibsp <- c(train$SibSp, test$SibSp)
temp.Parch <- c(train$Parch, test$Parch)

data.combined$family.size <- as.factor(temp.Sibsp + temp.Parch + 1)

ggplot(data.combined[1:891,], aes(x= family.size, fill = Survived)) +
  geom_bar() +
  facet_wrap(~Pclass + Title) +
  ggtitle("PClass, Title") +
  xlab("family.size") +
  ylab("Total Count") +
  ylim(0,300) +
  labs(fill = "Survived")


str(data.combined$Ticket)

data.combined$Ticket <- as.character(data.combined$Ticket)
data.combined$Ticket[1:20]

ticket.first.char <- ifelse(data.combined$Ticket == "", " ", substr(data.combined$Ticket, 1,1))
unique(ticket.first.char)

data.combined$ticket.first.char <-as.factor(ticket.first.char)


ggplot(data.combined[1:891,], aes(x= ticket.first.char, fill = Survived)) +
  geom_bar() +
  ggtitle("Suvivality by ticket.first.char") +
  xlab("ticket.first.char") +
  ylab("Total Count") +
  ylim(0,300) +
  labs(fill = "Survived")


ggplot(data.combined[1:891,], aes(x= ticket.first.char, fill = Survived)) +
  geom_bar() +
  facet_wrap(~Pclass) +
  ggtitle("PClass") +
  xlab("ticket.first.char") +
  ylab("Total Count") +
  ylim(0,300) +
  labs(fill = "Survived")



ggplot(data.combined[1:891,], aes(x= ticket.first.char, fill = Survived)) +
  geom_bar() +
  facet_wrap(~Pclass + Title) +
  ggtitle("PClass") +
  xlab("ticket.first.char") +
  ylab("Total Count") +
  ylim(0,300) +
  labs(fill = "Survived")


summary(data.combined$Fare)
length(unique(data.combined$Fare))

#Can't make fare a factor, treat as numeric & visualize with histogram

ggplot(data.combined[1:891,], aes(x= Fare, fill = Survived)) +
  geom_histogram(binwidth = 10) +
  ggtitle("PClass") +
  xlab("Fare") +
  ylab("Total Count") +
  ylim(0,200) +
  labs(fill = "Survived")


ggplot(data.combined[1:891,], aes(x= Fare, fill = Survived)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~Pclass + Title ) +
  ggtitle("PClass, Title") +
  xlab("Fare") +
  ylab("Total Count") +
  ylim(0,50) +
  xlim(0,400) +
  labs(fill = "Survived")

# Analysis of the cabin variable
str(data.combined$Cabin)

# Cabin really isn't a factor, make a string and the display first 100
data.combined$Cabin <- as.character(data.combined$Cabin)
data.combined$Cabin[1:100]

data.combined[which(data.combined$Cabin == ""), "cabin"]


# Take a look at just the first char as a factor
cabin.first.char <- as.factor(substr(data.combined$Cabin, 1,1))
str(cabin.first.char)
levels(cabin.first.char)


################### video 4

library(randomForest)
rf.train.1 <- data.combined[1:891, c("Pclass", "Title")]
rf.label <- as.factor(train$Survived)

set.seed(1234)
rf.1 <- randomForest(x = rf.train.1, y = rf.label, importance = TRUE, ntree = 1000)
rf.1
varImpPlot(rf.1)
############
rf.train.2 <- data.combined[1:891, c("Pclass", "Title", "SibSp")]
set.seed(1234)
rf.2 <- randomForest(x = rf.train.2, y = rf.label, importance = TRUE, ntree = 1000)
rf.2
varImpPlot(rf.2)

############
rf.train.3 <- data.combined[1:891, c("Pclass", "Title", "Parch")]
set.seed(1234)
rf.3 <- randomForest(x = rf.train.3, y = rf.label, importance = TRUE, ntree = 1000)
rf.3
varImpPlot(rf.3)


############
rf.train.4 <- data.combined[1:891, c("Pclass", "Title","SibSp", "Parch")]
set.seed(1234)
rf.4 <- randomForest(x = rf.train.4, y = rf.label, importance = TRUE, ntree = 1000)
rf.4
varImpPlot(rf.4)
rf.1









