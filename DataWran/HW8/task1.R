## Run this block of code as is
set.seed(2838);X <- data.frame(g1=rep(c('A','B','C'),each=4),g2=rep(c('U','V'),2), x=round(rnorm(12),2))
Y <- expand.grid(g1=c('A','B','C','D'), g2=c('U','V','W'))
Y$color <- c('white','black','gray','red','rust','orange','yellow','green', 'blue', 'blueviolet','indigo','purple')
Y$lty <- 1:nrow(Y)

head(X)
head(Y)

###### write a merge that left joins X and Y
## in comments describe the results of the merge
## are there NA values, does that make sense, why/why not? 

merge(x=X, y=Y, by=c('g1', 'g2'), all.x=TRUE)

## This makes sense because all the values of g1 and g2 that exist in X also exist in Y.
## So there are no NA values because of this.

###### write a merge that right joins X and Y
## in comments describe the results of the merge
## are there NA values, does that make sense, why/why not? 

merge(x=X, y=Y, by=c('g1', 'g2'), all.y=TRUE)

## This makes sense because there are g1 and g2 values in y that don't also exist in X.
## So there will be NA values in the 'x' column because this is a column unique to X.

###### write a merge that full joins X and Y
## in comments describe the results of the merge
## are there NA values, does that make sense, why/why not? 

merge(x=X, y=Y, by=c('g1', 'g2'), all=TRUE)

## This makes sense for the same reasons as the two joins above. This merge has NAs because
## there are values in Y that aren't in X in the g1 and g2 columns. 

###### Are any of the two joins identical? Write code that checks this. 
## Explain the results of your checking for identical and why it makes sense.


left <- merge(x=X, y=Y, by=c('g1', 'g2'), all.x=TRUE)
right <- merge(x=X, y=Y, by=c('g1', 'g2'), all.y=TRUE)
full <- merge(x=X, y=Y, by=c('g1', 'g2'), all=TRUE)

identical(left, right)
identical(left, full)
identical(right, full)

## The only two that are identical are the right and full data frames. This makes sense because
## the X data frame only contains values that are also in Y, while the Y data frame doesn't.
## So when we right join, it will put ALL the values that are different between the two data frames
## into the single one. Essentially, if X had different values from Y, then these two wouldn't be
## identical because then we would need to put the different values from X into the new frame
## in order to do the job of the full join. It makes sense that the rest aren't identical because
## the left join isn't accounting for the unique values in Y.


