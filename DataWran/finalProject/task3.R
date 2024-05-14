rm(list=ls())
data <- readRDS(file=file.path('~', 'schoolData.RDS'))

## Need to make a plot for each county so we will loop through all the counties
## Then make the plot with the correct formatting.
for (i in unique(data$countyName)) {
	pdf(file=file.path('~', paste0(i, '_Scatter', '.pdf')))

	tempDf <- subset(data, countyName == i)
	with(tempDf, plot(x=mathScore, y=englishScore, type='n', ylim=c(0, 100), xlim=c(0,100), xlab='Math Score', ylab='English Score', main=paste(i, 'Scores')))
	with(subset(tempDf, ses=='low'), points(x=englishScore, y=mathScore, pch = 0, col='red'))
	with(subset(tempDf, ses=='med'), points(x=englishScore, y=mathScore, pch = 1, col='blue'))
	with(subset(tempDf, ses=='high'), points(x=englishScore, y=mathScore, pch = 2, col='green'))

	legDf <- data.frame(ses=c('low', 'med', 'high'), color=c('red', 'blue', 'green'), pch=0:2)
	with(legDf, legend('topleft', legend=ses, col=color, pch=pch))

	graphics.off()
}

## Same thing as above except we need to reshape the data
## to handle the fact that we can't simply use two ratio variables here
## need to have one ratio variable with a type column to account for this
for (i in unique(data$countyName)) {
	pdf(file=file.path('~', paste0(i, '_Box', '.pdf')))

	tempDf <- subset(data, countyName == i)
	engDf <- data.frame(score=tempDf$englishScore, type='English', ses=tempDf$ses)
	mathDf <- data.frame(score=tempDf$mathScore, type='Math', ses=tempDf$ses)
	fullDf <- rbind(engDf, mathDf)
	fullDf <- fullDf[fullDf$score > 0,]
	with(fullDf, boxplot(score ~ type + ses, xlab='Class & SES', ylab='Score', col = c('blue','red'), main = paste(i, 'Scores')))
	with(legDf, legend('topleft', legend=c('English', 'Math'), fill=c('blue', 'red')))

	graphics.off()
}

## Repeated what I did above

pdf(file=file.path('~', 'TotalScatter.pdf'))

with(data, plot(x=mathScore, y=englishScore, type='n', ylim=c(0, 100), xlim=c(0,100), xlab='Math Score', ylab='English Score', main='Final Scores'))
with(subset(data, ses=='low'), points(x=englishScore, y=mathScore, pch = 0, col='red'))
with(subset(data, ses=='med'), points(x=englishScore, y=mathScore, pch = 1, col='blue'))
with(subset(data, ses=='high'), points(x=englishScore, y=mathScore, pch = 2, col='green'))

legDf <- data.frame(ses=c('low', 'med', 'high'), color=c('red', 'blue', 'green'), pch=0:2)
with(legDf, legend('topleft', legend=ses, col=color, pch=pch))

graphics.off()



pdf(file=file.path('~', 'TotalBoxPlot.pdf'))

engDf <- data.frame(score=data$englishScore, type='English', ses=data$ses)
mathDf <- data.frame(score=data$mathScore, type='Math', ses=data$ses)
fullDf <- rbind(engDf, mathDf)
fullDf <- fullDf[fullDf$score > 0,]
with(fullDf, boxplot(score ~ type + ses, xlab='Class & SES', ylab='Score', col = c('blue','red'), main = 'Total Scores'))
with(legDf, legend('topleft', legend=c('English', 'Math'), fill=c('blue', 'red')))

graphics.off()