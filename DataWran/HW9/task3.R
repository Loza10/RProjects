rm(list=ls())

## Start by reading in the the data from the RDS file
startDF <- readRDS(file=file.path('~', 'gpaMajorGender.RDS'))
majorGenderCol <- startDF$majorGender

## Regex to find the starting position and length of the gender
majorVec <- gregexpr(pattern='[-|_|[:space:]][m|f][[:lower:]]*', text=majorGenderCol, ignore.case=TRUE)

## Declare empty vectors to keep track of the cleaned GPAs and Majors
genderList <- c()
majorList <- c()
for (i in 1:length(majorGenderCol)) {
	tempStr <- majorVec[[i]]
	tempGender <- substr(x=majorGenderCol[i], start=tempStr+1, stop=tempStr - 1 + attr(tempStr, 'match.length'))
	tempMajor <- substr(x=majorGenderCol[i], start=1, stop=tempStr-1)

	## I'm going to clean/organize the values for readability sake
	## Check to see if they're M or F and format accordingly
	if (grepl(pattern='^[m]+', x=tempGender,ignore.case=TRUE)) {
		genderList <- append(genderList, 'male')
	} else {
		genderList <- append(genderList, 'female')
	}

	## Now need to check and see which major it is so we can correctly format it
	if (grepl(pattern='^[s]+', x=tempMajor, ignore.case=TRUE)) {
		majorList <- append(majorList, 'STAT')
	} else if (grepl(pattern='^[c]+', x=tempMajor, ignore.case=TRUE)) {
		majorList <- append(majorList, 'COSC')
	} else if (grepl(pattern='^[e]+', x=tempMajor, ignore.case=TRUE)) {
		majorList <- append(majorList, 'ECON')
	} else {
		majorList <- append(majorList, 'ECOL')
	}

}

#I'll omit na values since they existed in the GPA column
genderMean <- na.omit(data.frame(gender=genderList, gpa=startDF$gpa))
genderMean 

majorGpa <- na.omit(data.frame(gender=majorList, gpa=startDF$gpa))
majorGpa

allCol <- na.omit(data.frame(gender=genderList, major=majorList, gpa=startDF$gpa))
allCol
