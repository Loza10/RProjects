filesPath <- '~/data/'
savePath <- '~/pdfs/'
if (file.exists(filesPath)) {
	listOfFiles <- list.files(file.path(filesPath))
} else {
	print("File path for data doesn't exist")
}

## Loop through files, on the one after the 25th one (1 % 25), create the new file, on the 25th one (0 % 25)
## end the file creation. This way we can create the files and end the creation when appropriate.


for(i in 1:length(listOfFiles)) {
	pathData <- readRDS(file=file.path(filesPath, listOfFiles[i]))
	if (i %% 25 == 1) {
		fileName <- paste('data', as.character(i), '.pdf')
		pdf(file=file.path(savePath, fileName))
		par(mfrow=c(5,5))
	}
	hist(pathData)
	if (i %% 25 == 0) {
		graphics.off()
	}
}