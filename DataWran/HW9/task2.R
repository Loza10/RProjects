##### run as is
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)
data(top100commonWords,package='BetaBit')
#####

## The reason I chose to split the string for this function instead of using gsub()
## was because there were too many problems with gsub(), for instance, if we want to
## remove the word 'a', we have to specify ' a ' or else it will remove all occurences
## of the letter 'a'. We would also have to specify if it's at the beginning of a sentence
## or not. For instance, we would have to also check for ' a', and ' A ', and ' A'.

removeWord <- function(word, txt) {
	## Need to type check first so this won't throw an error.
	if (!is.character(word) | !is.character(txt)) {
		return("Error: your word must be of type character")
	}
	## Split the string by space so we can get a list of words in our text.	
	## Remove the occurences of word. Use tolower() to avoid case sensitivity.
	## Use the collapse argument to turn the list back to a string.
	wordList <- unlist(strsplit(txt, ' '))
	newTxt <- paste(wordList[tolower(word) != tolower(wordList)], collapse=' ')
	return(newTxt)
}

## Remove punctuation using regex for punctuation
text <- gsub(pattern='[[:punct:]]+', replacement='', x=text)

## Remove 100 words
for (i in top100commonWords) {
	text <- removeWord(i, text)
}

## To remove other words, just call the function
	## ex. text <- removeWord('america', text)


## Returns a data frame of the unique words along with their counts
countWord <- function(txt) {
	## Create two new vectors that hold the words and their counts
	## These two will match positions in their respective vectors
	wordList <- c()
	countList <- c()
	splitStr <- unlist(strsplit(txt, ' '))

	## Loop through all the strings in our list
	## If the string is in our vector, we know it's not unique, so increment count, else
	## add it to our vector and set it's count to 1.
	## We'll treat everything as lower case to avoid case sensitive issues.
	for (i in splitStr) {
		currStr <- tolower(i)
		lowerList <- tolower(wordList)
		if ((currStr %in% lowerList) & currStr != '') {
			countList[currStr == wordList] <- countList[currStr == wordList] + 1
		} else if (currStr != '') {
			wordList <- append(wordList, currStr)
			countList <- append(countList, 1)
		} 
	}
	return(data.frame(word=wordList, count=countList))
}
finalDF <- countWord(text)
finalDF