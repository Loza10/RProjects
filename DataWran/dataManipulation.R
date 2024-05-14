x <- 3

(0:10)*3

10:0

seq(from = 0, to = 10, by = 3)
seq(from = 0, to = 10, length=100)

rep(letters[1:3], times=3)
rep(letters[1:3], each=3)

X <- letters[1:3]
Y <- c('F', 'M')

#creates data frame of all combinations between two vectors
expand.grid(X, Y, stringsAsFactors=FALSE)

F <- factor(letters[1:5])
F

eyeColor <- c('blue', 'yellow', 'red')
h <- c(70, 56, 70.2)

jared <- 'bad'
harry <- 'ok'

#Factors create levels that have order to them
#Ordered strings will default to alphabetically
F <- factor(c('bad', 'ok', 'great'), ordered=TRUE)
F[1] < F[2]

F <- factor(rep(c('bad', 'ok', 'great'), 2), levels=c('bad', 'ok', 'great'), ordered=TRUE)
F
order(F)
F[order(F)]

#a method of sorting
x <- rep(1:4, times=4)
order(x)
x[order(x)]
sort(x)

as.numeric(c('1','2','3'))
as.numeric(F)

y <- letters[1:4]
z <- c(y, 'e')
length(y)
length(z)

F2 <- c(F, 'bad')
class(F2)

F[2] <- 'bad'
F[3] <- 'a ok'