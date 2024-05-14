########################################################
## Jared Studyvin
## 14 June 2016
## get method of moment (MOM) estimates from various distributions
########################################################

getMOM <- function(mean,sd,distribution,...){
    ## for debugging
    ## mean=40; sd=10
    ## 
    ## 
    ## distribution <- 'beta'


    ## check the distribution
    distn <- tolower(distribution)


    allowedDist <- c('rayleigh','gamma','weibull','llog','norm','gompertz','beta','cauchy','chisq','exp','lnorm')
    if(!distn%in%allowedDist){
        stop(paste0('distribution must be one of the following: ',paste(allowedDist,collapse=', ')))
    }

    (sampleMoments <- list(mean=mean, sd=sd))

    
    checkNumeric <- sapply(sampleMoments, is.numeric)
    checkLength <- sapply(sampleMoments, function(x){length(x)!=1})
    
    if(any(!checkNumeric) | any(checkLength)){
        stop('Argument(s): ',
             paste0(names(checkNumeric)[!checkNumeric | checkLength], collapse=', '),
             ' \n must be a single numeric value.')
    }
    



    ## weighted summaries
    (wmean <- mean)
    (wvar <- sd^2) ## the weighted variance might not be needed, but I'm not sure
    (maxx <- mean+4*sd)


    ##
    gompertzStart <- function(xbar,varx){

        eulerConst <- -digamma(1) ## Euler-Mascheroni Constant
        g <- function(b,xbar,varx,eulerConst){
            ## approximate solution see Lenart 2012
            a.b <- pi^2/12 - b^2*varx/2
            1/b * exp(a.b)*(a.b - log(a.b) - eulerConst)-xbar
        }
        (maxg <- sqrt(pi^2/(6*varx))) ## max value

        low <- 1e-5;up <- maxg-1e-5

        ##y <- seq(low,up,length=100)
        ##g(y,eulerConst=eulerConst,xbar=xbar,varx=varx)


        suppressWarnings(b <- stats::nlminb(low,g,eulerConst=eulerConst,xbar=xbar,varx=varx,lower=1e-5)$par)

        ## find the root
        ##b <- stats::uniroot(g,interval=c(low,up),eulerConst=eulerConst,xbar=xbar,varx=varx)$root
        ## use b to find a
        a <- b*pi^2/12 - b^3/2 * varx
        ##c(b,a)
        return(c(b,a)) ## scale and shape

    } ## end gompertzStart function


    weibullStart <- function(xbar,varx,maxx){
        ## method of moments for weibull parameters
        wei <- function(b,varx,xbar){
            out <- exp(lgamma(1+2/b)-2*lgamma(1+1/b)) - 1 - varx/xbar^2
            return(out)
        }

        b <- tryCatch({
            stats::uniroot(wei,interval=c(1e-1,maxx),varx=varx,xbar=xbar)$root
        },error=function(cond){
            ## message(cond)
            suppressWarnings(b <- stats::nlminb(start=1e-1,objective=wei,varx=varx,xbar=xbar,lower=1e-5)$par)
            return(b)
        })
        a <- xbar/gamma(1+1/b)
        return(c(b,a))
    } ## end weibullStart function


    betaStart <- function(xbar,varx){
        ## method of moments for beta parameters
        if(!varx<xbar*(1-xbar)){
            ## method of moments does work under this condition
            return(c(1,1))
        }

        alpha <- xbar*(xbar*(1-xbar)/varx -1)
        beta <- (1-xbar)*(xbar*(1-xbar) /varx -1)
        return(c(alpha,beta))
    } ## end betaStart function



    lnormStart <- function(wx){
        meanLog <- -log(sum(wx^2))/2 + 2*log(sum(wx)) - 3*log(length(wx))/2
        sdLog <- sqrt(log(wx^2) - 2*log(sum(wx)) + log(length(wx)))
        return(c(meanLog,sdLog))
    }# end lnormStart




    ##c('rayleigh','gamma','weibull','llog','norm','gompertz','beta','cauchy','chisq','exp','lnorm')
    ## This function gets the starting values for the distribution of interest.
    ## the method of moments is a cheap way to get starting values for the likelihood
    out <- switch(distn,
                  rayleigh=c(wmean/sqrt(pi/2)), ## scale
                  gamma=c(wmean^2/wvar,wmean/wvar), ## shape and rate
                  weibull=weibullStart(xbar=wmean,varx=wvar,maxx=max(x)), ## shape and scale
                  llog=c(pi/sqrt(3*wvar),log(wmean)), ## shape and scale
                  norm=c(wmean,sqrt(wvar)), ## mean and sd
                  gompertz=gompertzStart(xbar=wmean,varx=wvar), ## scale and shape
                  beta=betaStart(xbar=wmean,varx=wvar), ## shape1 and shape2
                  cauchy=c(wmean,wvar), ## location and scale
                  chisq=c(wmean), ## degrees of freedom
                  exp=c(1/wmean), ## rate
                  lnorm=lnormStart(wx=w*x), ## meanlog and sdlog
                  logis=c(wmean, sqrt(3*wvar)/pi) ## location and scale
                  ) #end switch
    return(out)
} #end function getMOM

rm(list=ls())

library(windAC)

sampleSize <- c(10, 30, 300)
distr <- c('norm', 'gamma')
popMean <- 10
popSD <- c(1, 5)
alpha <- 0.05
nSim <- 1000

dataListA <- list()
dataListB <- list()
set.seed(20240501)
for (ss in sampleSize) {
	for (d in distr) {
		for (sd in popSD) {
			ss;d;sd
			tempArg <- getMOM(mean=popMean, sd=sd, distribution=d)
			(tempArg1 <- tempArg[1])
			(tempArg2 <- tempArg[2])
			
			tempM <- matrix(nrow=nSim, ncol=ss)
			
			for (i in 1:nSim) {
				tempM[i,] <- windAC::rtrunc(n=ss, distribution=d, tbound=c(-Inf, Inf), tempArg1, tempArg2)
			}
			## Option A
			tmpName <- paste(d, ss, sd, sep='_')
			dataListA[[tmpName]] <- tempM
			
			## Option B
			tempMeta <- data.frame(distr=d, sampleSize=ss, stDev=sd)
			tempList <- list(meta=tempMeta, M=tempM)
			dataListB <- c(dataListB, tempList)
			
		}
	}
}

for (j in seq_along(dataListA)) {
	print(names(dataListA)[j])
	print(dim(dataListA[[j]]))	

}

checkInterval <- function(x, target, alpha) {

	n <- length(x)
	t <- qt(1-alpha/2, df=n-1)
	L <- mean(x) - t * sd(x)/sqrt(n)
	U <- mean(x) + t * sd(x)/sqrt(n)

	inside <- target >= L & target <= U

	return(inside)
}

resultDf <- NULL
for (k in seq_along(dataListA)) {
	tempCheck <- apply(dataListA[[k]], 1, FUN=checkInterval, target=popMean, alpha=alpha)
	mean(tempCheck)
	nameParts <- unlist(strsplit(names(dataListA)[k],'_'))
	tempDf <- data.frame(distr=nameParts[1], sampleSize=nameParts[2], popSD=nameParts[3], coverage=mean(tempCheck))
	resultDf <- rbind(resultDf, tempDf)
}
head(resultDf)





















