diaMatrix <- matrix(data=0:999999, nrow=1000, ncol=1000, byrow=TRUE)
diaMatrix[(diaMatrix %% 1001) != 0] <- 1
diaMatrix[(diaMatrix %% 1001) == 0] <- 0
diaMatrix[800,800]