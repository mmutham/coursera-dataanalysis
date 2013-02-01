housingData <- read.csv("ss06hid.csv")
housingUnitData <- housingData[housingData$TYPE == 1, ]
table(housingUnitData$VAL)[[24]]
