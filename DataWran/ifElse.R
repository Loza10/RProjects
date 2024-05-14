x <- runif(1, 0, 10)
y <- runif(1, 0, 10)

if (x < 2.5 | y < 2.5) {
	print('small')
	a <- x
} else if (x > 7.5 | y > 7.5) {
	print('big')
	b <- x
} else {
	print('middle')
	e <- x
}

print('all done')


y <- rep(TRUE, 20)
z <- rep(FALSE, 20)
w <- sample(c(TRUE, FALSE), size=20, replace=TRUE)

all(y)
all(z)
all(w)

any(y)
any(z)
any(w)

z <- TRUE
w <- FALSE

z | w
z & w

rm(list=ls())

x <- matrix(1:9, 3, 3)
x <- matrix(letters[1:9], 3, 3)

if (is.matrix(x) & is.character(x)) {
	print('MATRIX')
}

x <- sample(1:10, size=50, replace=TRUE)
##ifelse(test=condition, yes=, no=)

e <- ifelse(test= x%%2==0, 'even', 'odd')
d <- data.frame(x, e)
head(d)