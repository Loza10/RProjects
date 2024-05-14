iterations <- 0
#Alternatively you could create a boolean
while (TRUE) {
	iterations = iterations + 1
	newLetter <- sample(x=letters, size=1)
	if (newLetter == 'j') {
		break
	}
}
#It took 34 iterations 