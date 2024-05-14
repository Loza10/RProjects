plot(1:100, type='n', xaxt='n', yaxt='n')

axis(side=4,at=(1:26)*4, labels=LETTERS, las=2)

string <- c('hello', 'bye', 'cya')
string[1] <- 'good bye'

f <- factor(rep(letters[1:3], 5), ordered=TRUE)
f[2] <- 'a'
f
f[1] <- 'd'

typeof(factor(1:5))


set.seed(2);d <- sample(letters[1:3], size=1000, replace=TRUE)
head(d)
tab <- table(d)
graphics.off()
barplot(tab, col=c('red', 'blue', 'green'), ylab='Frequency', 
	xlab='Best Letters', main='Bar plotter man', ylim=c(0, 400), 
	names.arg=c('A', 'B', 'C'), legend.text=c('AA', 'BB', 'CC'))

graphics.off()
pie(tab, label=c('A', 'B', 'C'), clockwise=TRUE, init.angle=270)
