#declared lists for readability sake
scentList <- c('A', 'B', 'C')
colorList <- c('Green', 'Brown')
sizeList <- c('Small', 'Medium', 'Large')

#need to repeat only 1 list because the expand.grid() function will account for the rest
#sort only the sizeList for the same reason
dataFrame <- expand.grid(rep(scentList, times=10), colorList, sort(sizeList), stringsAsFactors=FALSE)
dataFrame
