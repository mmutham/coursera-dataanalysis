nrow(housingData[(housingData$BDS == 3 |is.na(housingData$BDS)) & (housingData$RMS ==4 | is.na(housingData$RMS)) & (!is.na(housingData$RMS) & !is.na(housingData$BDS)),])
nrow(housingData[(housingData$BDS == 2 |is.na(housingData$BDS)) & (housingData$RMS ==5 | is.na(housingData$RMS)) & (!is.na(housingData$RMS) & !is.na(housingData$BDS)),])
nrow(housingData[(housingData$BDS == 2 |is.na(housingData$BDS)) & (housingData$RMS ==7 | is.na(housingData$RMS)) & (!is.na(housingData$RMS) & !is.na(housingData$BDS)),])
