data(rivers)
for (i in 1:length(rivers)) {
	if (rivers[i] %% 5 == 0) {
		rivers[i] <- NA
	} else if (rivers[i] %% 2 == 0) {
		rivers[i] <- sqrt(rivers[i])
	}
}