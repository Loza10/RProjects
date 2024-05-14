paste('hello', 'bye', sep='-')
paste0('hello', 'bye')

x <- paste0(LETTERS, '?', letters, '_', 26:1)

paste0("'", x, "'", collapse=',')

## randomness

sample(x=letters[1:5], size=100, replace=TRUE, prob=c(7, 1, 1, 1, 1))
#how prob is working
c(7, 1, 1, 1, 1) / sum(c(7, 1, 1, 1, 1))

#generate random values from a normal distribution
rnorm(n=20, mean=5, sd=2)

a <- 3; b <- 4
set.seed(4); runif(n=4, min=0, max=1)