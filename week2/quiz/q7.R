agricultureLogical <- housingData$ACR == 3 & housingData$AGS == 6
indexes <- (which(agricultureLogical))
subset  = housingData[indexes,] 
table(complete.cases(subset))
table(is.na(subset$MRGX))[TRUE]