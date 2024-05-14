data(Titanic)
class(Titanic)
dim(Titanic)

#The first dimension is size 4 so it represents the classes (1st, 2nd, 3rd, Crew)
#The second dimension is of size two so it represents the sex (male or female)
#The third dimension is of size two so it represents the age (child or adult)
#The fourth dimension is of size two so it represents whether they survived or not (yes or no)
#Essentially the dimensions seem to represent the number of levels/categories that each number can fall into

newDf <- as.data.frame(Titanic)
sum(subset(newDf, Sex == 'Male' & Survived == 'Yes')$Freq)

#Decided to get the totals of each class and the overall total.
classTotal <- c(sum(subset(newDf, Class == '1st' & Survived == 'Yes')$Freq), sum(subset(newDf, Class == '2nd' & Survived == 'Yes')$Freq),sum(subset(newDf, Class == '3rd' & Survived == 'Yes')$Freq),sum(subset(newDf, Class == 'Crew' & Survived == 'Yes')$Freq))
classTotal
sum(classTotal)

#Same thing here.
ageTotal <- c(sum(subset(newDf, Age == 'Child' & Survived == 'Yes')$Freq), sum(subset(newDf, Age == 'Adult' & Survived == 'Yes')$Freq))
ageTotal
sum(ageTotal)