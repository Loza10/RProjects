rm(list=ls())
## priorNum is there to allow the user to specify what they want to prioritize for datasets that
## may contain multiple data types. TRUE will default priority to numerics, where FALSE will
## default priority to characters. factorSort accounts for factors since they have their own order.
myMedian <- function(dataSet, priorNum=TRUE, factorSort=FALSE, ...) {
	out <- NA
	if ((is.vector(dataSet) | is.matrix(dataSet)) & !is.list(dataSet)) {
		len <- length(dataSet)
		if (!factorSort) {
			realData <- sort(dataSet)
		} else {
			realData <- dataSet
		}
		if (len %% 2 == 0) {
			if (!is.numeric(dataSet)) {
				##can't get the average of two strings
				out <- NA
			} else {
				out <- (realData[len/2] + realData[len/2+1]) / 2
			}
		} else {
			out <- realData[ceiling(length(realData) / 2)]
		}
	} else if (is.data.frame(dataSet)) {
		numVec <- c()
		letVec <- c()
		for (i in 1:ncol(dataSet)) {
			if (is.numeric(dataSet[,i])) {
				numVec <- append(numVec, dataSet[,i])
			} else {
				letVec <- append(letVec, dataSet[,i])
			}
		}
		out <- findPath(letVec, numVec, priorNum, factorSort)
	} else if (is.array(dataSet)) {
		tempVec <- as.vector(dataSet)
		numVec <- c()
		letVec <- c()
		for (i in 1:length(tempVec)) {
			#this will see if our data can be accepted by a regular expression for numerics
			#if so we know it can be a number and not a string.
			if (grepl("^\\d+$", tempVec[i])) {
				numVec <- append(numVec, as.numeric(tempVec[i]))
			} else {
				letVec <- append(letVec, tempVec[i])
			}
		}
		out <- findPath(letVec, numVec, priorNum, factorSort)
	} else if (is.list(dataSet)) {
		#no need for names when calculating mean
		newList <- unlist(dataSet, use.names=FALSE)
		numVec <- c()
		letVec <- c()
		if (!is.numeric(newList) & !is.character(newList)) {
			out <- NA
		} else {
			for (i in 1:length(newList)) {
				if (grepl("^\\d+$", newList[i])) {
					numVec <- append(numVec, as.numeric(newList[i]))
				} else {
					letVec <- append(letVec, newList[i])
				}
			}
			out <- findPath(letVec, numVec, priorNum, factorSort)
		}
	} else if (is.factor(dataSet)) {
		tempVec <- as.vector(dataSet[order(dataSet)])
		numVec <- c()
		letVec <- c()
		for (i in 1:length(tempVec)) {
			if (grepl("^\\d+$", tempVec[i])) {
				numVec <- append(numVec, as.numeric(tempVec[i]))
			} else {
				letVec <- append(letVec, tempVec[i])
			}
		}
		out <- findPath(letVec, numVec, priorNum, TRUE)
	}
	#worse case return NA
	return(out)
}


findPath <- function(letVec, numVec, priorNum, factorSort, ...) {
	#check lengths of new vectors to see if priority is even needed
	if (length(letVec) == 0 & length(numVec) > 0) {
		out <- myMedian(numVec, priorNum=priorNum, factorSort=factorSort)
	} else if (length(letVec) > 0 & length(numVec) == 0) {
		out <- myMedian(letVec, priorNum=priorNum, factorSort=factorSort)
	} else if (length(letVec) > 0 & length(numVec) > 0) {
		if (priorNum) {
			out <- myMedian(numVec, priorNum=priorNum, factorSort=factorSort)
		} else {
			out <- myMedian(letVec, priorNum=priorNum, factorSort=factorSort)
		}
	} else {
		#worse case
		out <- NA
	}
	return(out)
}


