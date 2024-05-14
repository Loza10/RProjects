rm(list=ls())
db <- readRDS(file=file.path('~', 'ccExample.RDS'))

lapply(db, head, n=2)

people <- db$people
pay <- db$payment
transactions <- db$transactions
head(people)
head(transactions)

nrow(people)
nrow(transactions)
m <- merge(x=people, y=transactions, by='userID')

head(m)


nrow(m)
table(subset(m, lastName == 'Fisher')$store)
table(m$firstName, m$store)
aggregate(cost ~ store + firstName+lastName, data=m, FUN=mean)


d1 <- data.frame(id=1:5, x=rnorm(5))
d2 <- data.frame(id=3:8, y=rnorm(6))

d1
d2

#inner join, keeps ids in both
merge(x=d1, y=d2, by='id')

#left join, keeps all ids in x
merge(x=d1, y=d2, by='id', all.x=TRUE)

#right join, keeps all ids in y
merge(x=d1, y=d2, by='id', all.y=TRUE)

#full join, keeps all values
merge(x=d1, y=d2, by='id', all=TRUE)


dplyr::left_join()
dplyr::right_join()
dplyr::full_join()