listNum <- rep(NA, 10)
for (i in 1:10) {
	listNum[i] <- i ^ i
}
sd(listNum)