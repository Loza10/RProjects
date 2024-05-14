boolVec <- c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE)
sum(boolVec)
mean(boolVec)
#the sum() and mean() functions require numerics to work, so R will
#automatically typecase the booleans to integers where TRUE is represented
#as 1 and FALSE is represented as 0, so the sum of 6 represents the 6 TRUEs
#and the mean of 0.6 represents the 6 TRUEs divided by the 10 total elements