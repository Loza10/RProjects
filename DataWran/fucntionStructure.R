
myMean <- function (vec, omit=TRUE) {
	
	##argument checking
	if (!is.numeric(vec) & !is.logical(vec)) {
		##warning("NaN")
		stop("NaN")
	}
	
	vec <- vec[!is.na(vec)]
	n <- length(vec)
	s <- sum(vec, omit)
	
	out <- s / n
	return(out)
} #end myMean function

myMean(vec=c(1:26, NA), FALSE)







library(psych)
require(psych)

ls()
data(rivers)
ls()

##install.packages('psych')

geometric.mean(1:10)
geometric.mean