Files <- c('WY480140_ALTA_0658.csv', 'WY480540_BASIN_1991.csv', 'WY480915_BORDER_1458.csv', 'WY481175_BUFFALO_BILL_DAM_3649.csv', 'WY481675_CHEYENNE_2836.csv', 'WY481730_CHUGWATER_8790.csv', 'WY481905_COLONY_5951.csv', 'WY482595_DIVERSION_DAM_1327.csv', 'WY482715_DUBOIS_1476.csv', 'WY483100_EVANSTON_3425.csv', 'WY484065_GREEN_RIVER_6236.csv', 'WY485345_Lake_Yellowstone_2847.csv', 'WY485415_LARAMIE_5154.csv', 'WY485830_LUSK_6803.csv', 'WY486195_MIDWEST_1214.csv', 'WY486440_Moran_9705.csv', 'WY486660_NEWCASTLE_0202.csv', 'WY487105_PATHFINDER_DAM_0600.csv', 'WY487115_PAVILLION_3678.csv', 'WY487240_PINE_BLUFFS_6539.csv', 'WY487260_PINEDALE_6771.csv', 'WY487388_POWELL_FIELD_STATION_6778.csv', 'WY487760_RIVERTON_0259.csv', 'WY487845_ROCK_SPRINGS_3352.csv', 'WY487990_SARATOGA_1846.csv', 'WY488160_SHERIDAN_FIELD_STATION_7211.csv', 'WY488995_TORRINGTON_EXP_FARM_9001.csv', 'WY489615_WHEATLAND_5516.csv', 'WY489770_WORLAND_0653.csv', 'WY489905_YNP_MAMMOTH_7791.csv')
f <- c('and_Help_and', 'And_Help_hurry', 'help_now_and')
pattern <- 'and'


cat(Files, sep='\n')

idLoc <- gregexpr(pattern='^WY[0-9]+', text=Files)
idLoc

numLoc <- gregexpr(pattern='_[0-9]+', text=Files)
numLoc

placeLoc <- gregexpr(pattern='_[_A-Z]+', text=Files, ignore.case=TRUE)
placeLoc

table(unlist(lapply(idLoc, length)))
table(sapply(idLoc, length))
table(sapply(numLoc, length))
table(sapply(placeLoc, length))


temp <- idLoc[[1]]
temp$index.type

info <- data.frame()
for (i in 1:length(Files)) {
	tempFileLoc <- Files[i]
	tempIdLoc <- idLoc[[i]]
	tempNumLoc <- numLoc[[i]]
	tempPlaceLoc <- placeLoc[[i]]

	tmp <- data.frame(id=substr(x=tempFileLoc, start=tempIdLoc, stop=attr(tempIdLoc, 'match.length')),
		 place= substr(x=tempFileLoc, start=tempPlaceLoc, stop=tempPlaceLoc - 1 + attr(tempPlaceLoc, 'match.length')),
		 num= substr(x=tempFileLoc, start=tempNumLoc, stop=tempNumLoc - 1 + attr(tempNumLoc, 'match.length')))
	info <- rbind(info, tmp)
}
info

as.numeric(gsub('WY', '', info$id)) 
as.numeric(gsub('_', '', info&num))

install.packages('snakecase')
snakecase::to_lower_camel_case(info$place)


x <- c('a', 'ba', 'c', 'de', 'f')
grepl('a|f', x=x)
pat <- c('a', 'f')
paste0(pat, collapse='|')
nchar(f)

## search within the string elements
## first instance of a match within the string
regexpr(pattern=pattern, text=f, ignore.case=TRUE)

## search within the string elements
## return every instance of a match within the string
gregexpr(pattern=pattern, text=f, ignore.case=TRUE)

## search across the data structure for matches yes/no
## this returns position index for matches
grep(pattern=pattern, x=f)

## search across the data structure for matches yes/no
## this returns boolean index for matches
grepl(pattern=pattern, x=f)

## find and replace with the replacement string
## only on first instance of a match
sub(pattern=pattern, replacement='UW', x=f)

## find and replace with the replacement string
## on all instances of a match
gsub(pattern=pattern, replacement='UW', x=f)

## split the string
## find a character to split the string at
strsplit(x=f, split='_')

## give a starting and stopping point for index positions
## returns part of the string corresponding to the start and stop
substr(x=f, start=1, stop=4)


data(iris)
head(iris)
grepl('setosa', iris$Species)
subset(iris, grepl('setosa', iris$Species))


