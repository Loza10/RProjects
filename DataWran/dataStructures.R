x <- 3
y <- 5

x%%2
#checks to see if integer
x%%1

x+y
x-y
x*y
x/y
x^2

#defaults to natural log
log(x, base=10)
exp(x)

for (x in 1:5)
	print(x)


#data structures
x <- c(4,5,6,7,8)
length(x)
#access specific elements
x[c(1,5)]
x[c(TRUE, FALSE, FALSE, FALSE, TRUE)]

#wrap in parentheses to print as well
(y <- x %% 2)
x[y == 0]

#predefined vector of alphabet
#negative sign gives everything but the specified elements
letters[-c(13, 6, 8, 24)]
LETTERS
pi

x <- c(4,5,6,7,8,9,10,11,12)
length(x)
#byrow determines how the matrix is filled
(M <- matrix(data=x, nrow=3, ncol=3, byrow=TRUE))
(V <- matrix(data=x, nrow=3, ncol=3, byrow=FALSE))
#transpose a matrix
t(M)
#drop property keeps it as a matrix (for matrix operations)
M[2,,drop=FALSE]
M*V #element wise
M%*%V #linear algebra wise
dim(M[,c(1),drop=FALSE])

array(data=c(letters,LETTERS), dim=c(2,13,2))
1:5
A <- array(1:120,dim=c(2,3,4,5))
A[1,2,3,4]

nrow(M)
ncol(M)
#returns matrix with lower diagonal being true, else false
lower.tri(M)
upper.tri(M)
M[lower.tri(M)]
diag(M)

#takes to vectors and makes matrix out of them
cbind(1:8, letters[1:8])
rbind(1:8, letters[1:8])

#NA data type acts as a place holder (fill in missing values)

#data frame allows different columns to have different data types.
(d <- data.frame(let=letters, x=1:26, hello='hello'))
typeof(M)
str(d) #means structure info
d[4,3]
d$let #gets the column based on name
d[, c('x'), drop=FALSE]
head(d, n=3)
tail(d, n=3)
d$x[4]
d$newCol <- LETTERS
d


L <- list(letters, d, M, matrix, TRUE)
L2 <- list(letters, FALSE, 4, sum, L)
#unnamed list
W <- list(1,2,3,4)
class(W)
A <- W[[1]]
typeof(A)

#named list
U <- list(a=1, b=2, c=3, d=4, m=matrix)
U
U$c
matrix(3, nrow=2, ncol=2)
U$m(3, nrow=2, ncol=2)

rm(list=ls())
ls()

#typecasting
as.character()
as.numeric()
