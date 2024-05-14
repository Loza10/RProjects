#### Run this line as is
set.seed(23838);randomLetters <- paste0(sample(letters,10000,replace=TRUE),collapse='')

head(randomLetters)

## list of the 100 most common words in English
data(top100commonWords,package='BetaBit') # may need to install the package first


########## 
## Write code that determines if any of the most common words appear in the randomLetters
## if a word appears how many times does it appear?
## What are the positions of the words that appear? 
## create a new vector that is the words extracted from the randomLetters


## Declare empty data frames to add words to, along with their counts and ids
## posLoc will keep track of the positions each word appears along with the id that
## corresponds to the word. 
wordCount <- data.frame(word=character(), count=integer(), id=integer())
posLoc <- data.frame(start=integer(), end=integer(), id=integer())
id <- 0
extractedWords <- c()


## Loop through words in the dataset. For each word, we need to check each if it exists in the
## random words dataset. We can do this using substring, which will return part of the string.
## The starting position is x and the ending position is essentially just accounting for the length
## of the word we're looking for.
for (i in top100commonWords) {
	id <- id + 1
	for (x in 1:(nchar(randomLetters) - nchar(i))) {
		if (substr(randomLetters, x, (x+nchar(i)-1)) == i) {

			## Need to check if the word already exists in our data frame so we're not readding it.

			if (any(wordCount == i) == TRUE) {
				wordCount[wordCount$word == i,]$count <- as.numeric(wordCount[wordCount$word == i,]$count) + 1
			} else {
				wordCount[nrow(wordCount) + 1,] <- c(i, 1, id) 
			}
			posLoc[nrow(posLoc) + 1,] <- c(x, x+(nchar(i)-1), id)
			extractedWords <- append(extractedWords, substr(randomLetters, x, (x+nchar(i)-1)))
		}
	}
}

wordCount
posLoc
extractedWords

## This is my solution from last week. After learning about using regular expressions for
## pattern matching, there's certainly an easier way to do this without using a nested for
## loop and using rbind. However, going through the process of making this taught me quite
## a bit, so I'll keep this as my solution. 

