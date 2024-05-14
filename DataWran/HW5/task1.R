
rm(list=ls())
ifTest <- function(dataStruct, omit=TRUE) {
	##By default remove NAs, however the user can pass FALSE through the second argument
	##in order to keep the NAs.

	if (is.data.frame(dataStruct)) {
		if (ncol(dataStruct) >= 4) {
			return(data.frame(firstCol=dataStruct[,1], secondCol=dataStruct[,2], 
				thirdCol=dataStruct[,ncol(dataStruct)-1], fourthCol=dataStruct[,ncol(dataStruct)]))
		} else {
			## we'll just return the entire data frame if there aren't more than 4 columns
			return(dataStruct)
		}

	} else if (is.list(dataStruct)) {
		nameList = names(dataStruct)
		if (!is.vector(nameList)) {
			return('Unnamed List, Try Again')
		} else {
			return(nameList)
		}

	} else if ((is.vector(dataStruct) | is.array(dataStruct) | 
			is.matrix(dataStruct)) & is.numeric(dataStruct)) {
		return(median(dataStruct, na.rm=omit))

	} else if (is.factor(dataStruct)) {
		return("Factors are pain")

	} else if (is.vector(dataStruct) & !is.numeric(dataStruct)) {
		#we'll just round up for simplicity sake.
		return(dataStruct[ceiling(length(dataStruct) / 2)])

	} else if (is.matrix(dataStruct) & !is.numeric(dataStruct)) {
		return(dataStruct[ceiling(nrow(dataStruct)/2),])

	} else if (is.array(dataStruct) & !is.numeric(dataStruct)) {
		if (length(dim(dataStruct)) > 2) {
			#in order to account for n-sized arrays, we need to get the number of dimensions
			#and parse that for evalution since arrays require every dimension to be specified
			tempStr <- ''
			parseStr <- 'newArray <- dataStruct[,  '
			for (i in 3:length(dim(dataStruct))) {
				tempStr <- paste0(tempStr, ',1') 
			}
			parseStr <- paste0(parseStr, tempStr , ']')
			eval(parse(text=parseStr))
			return(newArray)
		} else {
			return(dataStruct)
		}

	} else {
		stop('You must be using a unique data structure')
	}
	return(NA)
}

