monthList <- sample(x=month.name, size=5000, replace=TRUE)
#match will take the month name and match it with the number
#it's needed in order to get the correct corresponding abbreviation
monthAbb <- month.abb[match(monthList, month.name)]
myFrame <- data.frame(month=monthList, abb=monthAbb, three=3, range=c(1:100))
myFrame