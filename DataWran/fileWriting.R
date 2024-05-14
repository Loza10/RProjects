install.packages('readxl')

path <- ''C:\Users\zlove\''

file.path('C:', 'Users', 'zlove')

setwd('~')

path <- '~/working/'
dir.exists(path)
dir.create(path)

data(iris)

write.csv(iris, file.path(path, 'iris.csv'), row.names=FALSE)
list.files(path)

d <- iris[1:3,]
rownames(d) <- c('hello', 'bye', 'see ya')
d

library(writexl) 
write_xlsx(x=iris, path=file.path(path, 'iris.xlsx'))

list.files(path)

write.csv(x, file.path(path, 'test.csv'))

########################################
##DAY 2#################################
########################################

library(readxl)
path <- '~/working'
setwd(path)
getwd()

d <- read.csv(file.path(path, 'iris.csv'))
head(d)
datIris <- as.data.frame(read_excel(path=file.path(path, 'iris.xlsx'), sheet='iris'))
datWran <- as.data.frame(read_excel(path=file.path(path, 'iris.xlsx'), sheet='dataWrangling'))
datIris
datWran


rm(list=ls())
path <- '~/working'

data(iris)
data(rivers)
ugly <- list(mean, rivers, letters)
fun <- function(a,b) {
	out <- a + b
	return(out)
}
save(iris, rivers, ugly, fun, file=file.path(path, 'junk.RData'))
search()

ls()
rm(list=ls())
ls()
path <- '~/working'
ls()
load(file=file.path(path, 'junk.RData'))
ls()
ugly[[1]]

mod <- lm(Sepal.Length ~ Sepal.Width, data=iris)
class(mod)
print(mod)
coef(mod)
summary(mod)


rm(list=ls())
ls()
path <- '~/working'
load(file=file.path(path, 'junk.RData'))

##RDS files only allow for 1 variable/object to be saved.
saveRDS(ugly, file=file.path(path, 'ugly.RDS'))
myUgly <- readRDS(file=file.path(path, 'ugly.RDS'))
ls()




