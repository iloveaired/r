require('urca')
data(nporg)
gnp <- na.omit(nporg[, "gnp.r"])
gnp
summary(ur.df(y = gnp, lags = 4, type = "trend", selectlags = "BIC"))
