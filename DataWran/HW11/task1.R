filesPath <- '~/data/'
savePath <- '~/pdfs/'
if (file.exists(filesPath)) {
	listOfFiles <- list.files(file.path(filesPath))
} else {
	print("File path for data doesn't exist")
}

## Need to write a function to check and see if a number is prime. 

is_prime <- function(n) {
	if (n == 1) {
		return(FALSE)
	}
	if (n == 2) {
		return(TRUE)
	}
	for (i in 2:(n-1)) {
		if (n %% i == 0) {
			return(FALSE)
		}
	}
	return(TRUE)
}

## Need to loop through the files and pick out the number to check and see what condition it falls under.
## Some numbers will fall under multiple like 17, so I decided to prioritize multiples before prime numbers.

if (file.exists(filesPath) & file.exists(savePath)) {
	for (i in listOfFiles){
		fileNumber <- as.numeric(regmatches(i, gregexpr(pattern='[0-9]+', text=i)))
		fileName <- paste('data', as.character(fileNumber), '.pdf')
		pathData <- readRDS(file=file.path(filesPath, i))
		pdf(file=file.path(savePath, fileName))
		if (fileNumber %% 5 == 0) {
			hist(pathData)
			abline(v=mean(pathData))
		} else if (fileNumber %% 7 == 0) {
			hist(pathData)
			abline(v=mean(pathData)+sd(pathData))
		} else if (fileNumber %% 6 == 0) {
			hist(pathData)
			abline(v=mean(pathData)-sd(pathData))
		} else if (fileNumber %% 9 == 0) {
			hist(pathData, col='red')
		} else if (fileNumber %% 17 == 0) {
			hist(pathData, col='yellow')
		} else if (is_prime(fileNumber)) {
			hist(pathData, col='blue')
		} else {
			hist(pathData)
		}
		graphics.off()
	}
}
