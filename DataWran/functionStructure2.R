checkVal <- function (a) {
	if (a < 0) {
		out <- 'negative'
		print('negative')
	} else if (a > 0) {
		out <- 'positive'
		print('positive')
	} else {
		out <- 'zero'
		print('zero')
	}
	return(out)
	'bad job'
}

x <- checkVal(-4)
x

myMean <- function(a) {

	out <- mean(x=a)
	return(out)
}
w <- c(1:10, NA)
mean(w, na.rm=TRUE)

myMean(a=w, na.rm=TRUE)

myMyMean <- function(b, ...) {

	out <- myMean(a=b, ...)
	return(out)
}


crazy <- function(vec, nr, nc, ...) {

	avg <- mean(vec, ...)
	med <- median(vec, ...)
	s <- sd(vec)
	summary <- c(avg, med, s)
	out <- matrix(summary, nrow=nr, ncol=nc, ...)
	return(out)
}

M <- crazy(vec=w, nr=3, nc=3, byrow=TRUE, na.rm=TRUE)
M


factorial(4)
median(c(2,1,3))
