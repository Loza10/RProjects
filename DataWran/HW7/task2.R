rm(list=ls())

path <- '~/manyData'
files <- list.files(path, full.names=TRUE)
listDF <- lapply(files, readRDS)
longDF <- do.call("rbind", listDF)

#we can use the unique() function to get all the unique (not duplicated) entries from the data frame
shortDF <- unique(longDF)
shortDF