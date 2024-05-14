path <- '~/working/'
list.files(path)

x <- rnorm(1000)
hist(x)

graphics.off()
## function to start the save
##pdf(file=file.path(path, 'hist.pdf'))
jpeg(file=file.path(path, 'hist.jpeg'))

## all code for the plot
hist(x)

## end the save
graphics.off()


## opening multiple windows
hist(x)
windows();plot(1:100)



par(mfrow=c(3,4))
for(i in 1:6) {
	hist(rnorm(1000))
	plot(1:100)
}

## run graphics.off() to stop the par() function
graphics.off()
y <- rnorm(1000, mean=100, sd=5)
hist(y)


plot(1:100, type='n')
abline(h=10)
abline(v=c(30,20,50,70,80))

## for regression lines: abline(a=100,b=-2,reg=)

install.packages('wordcloud')
graphics.off();plot(1:100, type='n')
##abline(h=0:100, v=0:100)
text(x=50,y=50,labels='A')
text(x=50,y=50,labels='A', pos=1, col='red')
text(x=50,y=50,labels='A', pos=2, col='blue')
text(x=50,y=50,labels='A', pos=3, col='green')
text(x=50,y=50,labels='A', pos=4, col='purple')

points(50, 75, col='orange')
text(50, 75, pos=3, labels="This is fun", col='orange')


graphics.off();plot(1:100, type='n')

##text(50, 90, labels='Yi = Beta + Beta1Xi + ei')
text(50, 90, labels=bquote(Y[i]==beta[0]~'+'~beta[1]~X[i]~'+'~e[i]), cex=1)

beta0 <- 20
beta1 <- 0.5
abline(a=beta0, b=beta1)
text(50, 20, labels=bquote(hat(Y[i])==.(beta0)~'+'~.(beta1)~X[i]), cex=1)


graphics.off();plot(1:100, type='n')
text(x=c(25,50,75), y=c(25,50,75), labels=letters[1:3], col=c('green', 'red', 'blue'), cex=1:3, pos=2:4)


graphics.off();plot(1:100, type='n')

## x=topleft, bottomright, bottomleft, topright, bottom, top, right, left, center
legend(x='topright', legend=c('Math', 'English', 'Science')) 

































