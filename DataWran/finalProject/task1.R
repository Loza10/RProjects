rm(list=ls())

## Need to first read in the RDS file that contains the data.
countyInfo <- readRDS(file=file.path('~/data', 'countyInfo.RDS'))
countyNames <- names(countyInfo)

## Create an empty data frame that will act our finished data frame.
## Need to loop through all the names, I tried to do this without a loop and couldn't figure it out.
finalDf <- data.frame()
for (i in countyNames) {
	## Some county names overlapped, so need to check and see if this will grab all the files.
	fileName <- list.files("data", pattern=paste(substr(i, 1, 3)), full.names=TRUE, ignore.case=TRUE)
	if (length(fileName) != 3) {
		fileName <- list.files("data", pattern=paste(substr(i, 1, 4)), full.names=TRUE, ignore.case=TRUE)
	}

	## Them open all the files with the data per county
	tempDf <- lapply(fileName, readRDS)

	## Reduce them to a single data frame that can be used to combine with the others.
	goodDf <- Reduce(function(x, y) merge(x, y, all=TRUE), tempDf)

	## Need to add the info from the countyInfo dataset.
	goodDf$countyName <- i
	goodDf$population <- countyInfo[[i]][1]
	goodDf$numHs <- countyInfo[[i]][2]
	goodDf$totalStudents <- countyInfo[[i]][3]
	finalDf <- rbind(finalDf, goodDf)
}

## I noticed the SES had multiple ways of representing low and medium
## so I went ahead and made them all the same, and formatted the high while I was at it.
finalDf$ses <- gsub(pattern='LOW', replacement='low', x=finalDf$ses)
finalDf$ses <- gsub(pattern='H', replacement='high', x=finalDf$ses)
finalDf$ses <- gsub(pattern='medum|medium', replacement='med', x=finalDf$ses)

## I don't like dealing with spaces and different casings so I went ahead and made everything
## uniform for this enligh class section.
finalDf$englishClass <- gsub(pattern='american lit', replacement='lit', x=finalDf$englishClass)
finalDf$englishClass <- gsub(pattern='language arts I', replacement='lang1', x=finalDf$englishClass)
finalDf$englishClass <- gsub(pattern='languageArts2', replacement='lang2', x=finalDf$englishClass)

## Just wanted to shorten some of the class names because it will be tedious to spell
## out trigonometry in later tasks.
finalDf$mathClass <- gsub(pattern='trigonometry', replacement='trig', x=finalDf$mathClass)
finalDf$mathClass <- gsub(pattern='calculus', replacement='calc', x=finalDf$mathClass)

## Some of the county names were improperly formatted with spaces and casings so I went ahead
## and fixed this problem.
finalDf$countyName <- gsub(" ", "", finalDf$countyName)
finalDf$countyName <- snakecase::to_upper_camel_case(finalDf$countyName)
finalDf[finalDf$countyName == 'WEston',]$countyName <- 'Weston'

# Going to save it to the working directory
saveRDS(finalDf, file=file.path('~', 'schoolData.RDS'))
