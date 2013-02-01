popData <- read.csv("ss06pid.csv")
m1 <- merge(housingData, popData, by="SERIALNO", all=T)
dim(m1)