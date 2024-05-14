data(npk)
?npk

#need these to be characters instead of factors
npk$N <- as.character(npk$N)
npk$P <- as.character(npk$P)
npk$K <- as.character(npk$K)

#change the values where they equal 0 or 1 respectively
npk$N[npk$N == 0] <- 'No'
npk$N[npk$N == 1] <- 'Yes'

npk$P[npk$P == 0] <- 'No'
npk$P[npk$P == 1] <- 'Yes'

npk$K[npk$K == 0] <- 'No'
npk$K[npk$K == 1] <- 'Yes'

#paste function is for string concatination
npk$combined <- paste(npk$N, npk$P, npk$K, sep="-")
npk
