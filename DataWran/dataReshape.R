rm(list=ls())
set.seed(2)
require('tidyr')
d <- data.frame(x=rep(c(2,5),each=5),
                A = c(sample(1:10, 8), NA,NA),
                B = sample(12:40, 10, replace=TRUE),
                C= sample(100:1000,10, replace=TRUE))

df <- data.frame(row = rep(c(1, 51), each = 3),
                      var = c("Sepal.Length", "Species", "Species_num"),
                  value = c(5.1, "setosa", 1, 7.0, "versicolor", 2))

d$ID <- 1:nrow(d)

d2 <- reshape(data=d,
		 direction='long',
		 varying=c('A', 'B', 'C'), #wide col names
		 v.names='num', #new col name for the data under the wide names
		 timevar='group', #new long col name for thw wide outcomes
		 times=c('A', 'B', 'C'), #outcomes values in the new long data
		 idvar='ID')


head(reshape(data=d,
		 direction='long',
		 varying=c('A', 'B', 'C'),
		 v.names='num',
		 timevar='group', 
		 times=c('alpha', 'beta', 'gamma')))
head(d2)
d



d3 <- reshape(data=d2, direction='wide',
	 timevar='num',
	 idvar='ID',
	 v.names='group',
	 varying=c('A', 'B', 'C'))

x <- iris[, c('Sepal.Width', 'Species')]
x$id <- 1:nrow(x)

reshape(x, direction='wide', timevar='Species', idvar='id', varying=c('setosa', 'versicolor', 'virginica'))

dl <- tidyr::pivot_longer(d, cols=c('A', 'B', 'C'), names_to='group', values_to='num')
## Needs an ID to work since it has to pair points with each other
dw <- tidyr::pivot_wider(dl, names_from='group', values_from='num')

dl
dw


## DATES ##

tDay <- Sys.Date()
class(tDay)
tDay + 30

as.Date(x='3:apr:24', format=%d:%b:%y')


myDates <- c('3 april 24 3:12:54', '3 4 24 3:12:54')
as.POSIXct(x=myDates, format='%d %b %y %H:%M:%S', tz='US/Samoa')

tzCodes <- OlsonNames()
format(tDay, format='%d/%m/%y')


library('lubridate')
x <- c('4 3 24', '04-03-2024', '04/03/24', '04/03/2024', 'apr  3, 2024')
mdy(x)

myDate <- mdy('10 26 2001')
myDate
month(myDate, label=TRUE)
wday(myDate, label=TRUE)

week(myDate)



















