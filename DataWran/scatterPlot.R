data(schoolProgram, package='syllogi')
head(schoolProgram)

d <- schoolProgram

d$sesProg <- paste(d$ses, d$prog, sep='-')
table(d$sesProg)

tab <- with(d, table(prog, ses)) 
tab

t(tab)

barplot(tab, legend=TRUE, beside=TRUE, col=c('red', 'green', 'blue'))

head(d)

plot(x=d$read, y=d$math)

d <- schoolProgram[order(schoolProgram$math),]

d$color <- 'red'
d$color[d$ses=='middle'] <- 'blue'
d$color[d$ses=='high'] <- 'green'
with(d, plot(read, math, col=color))
legend('topleft', legend=c('low', 'middle', 'high'), pch=1, col=c('red', 'blue', 'green'))

with(d, plot(x=read, y=math, type='n', col=c('red', 'blue'), ylim=c(0, 100), xlim=c(0,100), 
xlab='reading', ylab='mathing', pch=15))

with(subset(d, ses=='low'), points(x=read, y=math, col='red'))
with(subset(d, ses=='middle'), points(x=read, y=math, col='blue'))
with(subset(d, ses=='high'), points(x=read, y=math, col='green'))

with(d, points(x=read, y=math))

with(d, points(x=mean(read), y=mean(math), pch=15, col='red'))
with(d, points(x=median(read), y=median(math), pch=17, col='blue'))

abline(h=50)
abline(h=70, lty=2)

abline(h=(1:9)*10, lty=1:9)

x <- seq(-3, 3, length=1000)
f <- dnorm(x=x, mean=0, sd=1)

plot(x=x, y=f, type='l')

y <- x^2
plot(x, -1*y, type='l')


fun <- function(x) {
	out <- x^2
	return(out)
}
plot(x, fun(x), type='l')


### DAY 2 ###

data(schoolProgram, package='syllogi')
head(schoolProgram)

legDf <- data.frame(ses=c('low', 'middle', 'high'), color=c('pink', 'magenta', 'maroon'), pch=0:2)
legDf

d <- dplyr::left_join(schoolProgram, legDf)

with(d, table(ses, color))
with(d, plot(read, math, col=color, pch=pch))

with(legDf, legend('topleft', legend=ses, col=color, pch=pch))

d2 <- d[order(d$gender, d$ses),]
str(d2)

d2$gender <- factor(d2$gender, levels=c('male', 'female'))
d2$ses <- factor(d2$ses, levels=c('low', 'middle', 'high'))

x <- 'wee'
with(d2, boxplot(math ~ gender + ses, main=paste0(x, 'woo')))





















