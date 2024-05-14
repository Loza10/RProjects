install.packages('syllogi')
data(schoolProgram, package='syllogi')
head(schoolProgram)

b <- schoolProgram$prog=='vocational'
length(b) == nrow(schoolProgram)
sum(b)

newDf <- schoolProgram[b,]
nrow(newDf)

voc <- subset(schoolProgram, prog=='vocational')
nrow(voc)

names(voc)[1] <- 'ID'
identical(newDf, voc)

table(schoolProgram$schtyp)
table(schoolProgram$schtyp, schoolProgram$prog)

voc <- subset(schoolProgram, prog!='vocational' & schtyp=='private')
nrow(voc)

voc <- subset(schoolProgram, prog%in%c('general', 'academic'))
nrow(voc)


x <- rep(letters[1:3], each=5)
x
bx <- x%in%c('a','c')
data.frame(x,bx)


voc <- subset(schoolProgram, gender=='male' & ses!='low' & schtyp=='public' & read>=50)
nrow(voc)
voc

newVoc <- subset(schoolProgram, (ses=='low' & read <= 50) | (ses=='high' & read >= 50))
newVoc
##############
### DAY 2 ####
##############
library('syllogi')
data(schoolProgram, package='syllogi')
data(iris)
data(mtcars)

dfList <- list(schoolProgram, iris, mtcars)

myFun <- function(x) {
	out <- c(nrow(x), ncol(x))
	return(out)
}
lapply(X = dfList, FUN = nrow)
sapply(X = dfList, FUN = head)
lapply(X = iris, class)
sapply(X = iris, class)

lapply(X = dfList, FUN = sapply, class)

tapply(X = iris$Sepal.Length, INDEX = iris$Species, FUN = mean)
tapply(X = schoolProgram$read, INDEX = schoolProgram[,c('prog', 'gender', 'ses')],FUN=mean)

aggregate(read ~ prog + gender + ses, data=schoolProgram, FUN=mean)


d1 <- 4
d2 <- 5
d3 <- 6
A <- array(rnorm(n=d1*d2*d3, mean=100), dim=c(d1,d2,d3))
A

apply(X = A, MARGIN = c(1,3), FUN = mean)
mean(A[1,,1])

M <- matrix(,nrow=d1,ncol=d3)
for (i in 1:dim(A)[1]) {
	for (x in 1:dim(A)[3]) {
		M[i,x] = mean(A[i,,x])
	}
}
M






