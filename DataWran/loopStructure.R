
something <- c(7,9,2,4,18)
for(i in something) {
	print(i)
}

rm(list=ls())
data(iris)
y <- rep(NA, nrow(iris))
for (rowNum in 1:nrow(iris)) {
	tmpSL <- iris[rowNum, 'Sepal.Length']
	if (tmpSL <= 5.1) {
		next
		y[rowNum] <- 'Small'	
	} else if (tmpSL <= 5.8) {
		y[rowNum] <- 'Medium'
	} else if (tmpSL <= 6.4) {
		y[rowNum] <- 'Bigger'
	} else {
		break
		y[rowNum] <- 'Biggest'
	}
}
length(y)
y

done <- FALSE
rowNum <- 1
while(!done) {
	tmpSL <- iris[rowNum, 'Sepal.Length']
	rowNum <- rowNum+1
	
	if (rowNum > nrow(iris)) {
		done <- TRUE
	}
}

rowNum
