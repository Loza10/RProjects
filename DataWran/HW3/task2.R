#rnorm returns a vector (putting this year for future reference)
myList <- list(meanFunc=mean, randNum=rnorm(n=1000), logFunc=log)
myList$logFunc(myList$meanFunc(myList$randNum))