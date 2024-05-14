rm(list=ls())
path <- '~/manyData'
fileList <- list.files(path)
dataList <- list()

for (i in fileList) {
	temp <- readRDS(file=file.path(path, i))
	dataList <- append(dataList, temp)
}
dataList