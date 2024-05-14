rm(list=ls())
data <- readRDS(file=file.path('~', 'schoolData.RDS'))
head(data)

d1 <- aggregate(student ~ countyName+HS, data=data, FUN=length)
write.csv(d1, file.path('~', 'studentPerHS.csv'), row.names=FALSE)

d2 <- aggregate(student ~ countyName+totalStudents, data=data, FUN=length)
d2 <- data.frame(studentProp=d2$student / d2$totalStudents, countyName=d2$countyName)
write.csv(d2, file.path('~', 'studentProp.csv'), row.names=FALSE)

d3a <- merge(aggregate(englishScore ~ countyName+ses, data=data, FUN=mean), aggregate(mathScore ~ countyName+ses, data=data, FUN=mean))
d3b <- merge(aggregate(englishScore ~ countyName+ses, data=data, FUN=sd), aggregate(mathScore ~ countyName+ses, data=data, FUN=sd))
names(d3b)[names(d3b) == 'englishScore'] <- 'englishSD'
names(d3b)[names(d3b) == 'mathScore'] <- 'mathSD'
d3 <- merge(d3a, d3b)
d3 <- d3[rev(order(d3$mathScore)),]
write.csv(d3, file.path('~', 'countyScoreMeanSD.csv'), row.names=FALSE)

d4 <- as.data.frame(tidyr::pivot_wider(aggregate(englishScore ~ countyName+ses, data=data, FUN=mean), names_from='ses', values_from='englishScore'))
write.csv(d4, file.path('~', 'englishSes.csv'), row.names=FALSE)

d5 <- as.data.frame(tidyr::pivot_wider(aggregate(mathScore ~ countyName+ses, data=data, FUN=mean), names_from='ses', values_from='mathScore'))
write.csv(d5, file.path('~', 'mathSes.csv'), row.names=FALSE)