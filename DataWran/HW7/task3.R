rm(list=ls())

meanVec <- c()
data(mtcars)
sapply(X = mtcars, FUN = mean)
apply(X = mtcars, MARGIN = 2, FUN = sd)
for (i in 1:ncol(mtcars)) {
	meanVec <- append(meanVec, mean(mtcars[,i]))
}
names(meanVec) <- names(mtcars)
meanVec
