library("psych")
library("ggplot2")
library("Hmisc")
# Making a copy of loansData
rawLoansData <- loansData

# data munging activity
loansData$Interest.Rate <- sapply(sub("%", "", loansData$Interest.Rate), as.numeric)
loansData$Debt.To.Income.Ratio <- sapply(sub("%", "", loansData$Debt.To.Income.Ratio), as.numeric)
loansData$Amount.Requested <- cut2(loansData$Amount.Requested, g=8)
loansData$Revolving.CREDIT.Balance <- cut2(loansData$Revolving.CREDIT.Balance, g=8)

# remove employment length n/a
#loansData$Employment.Length[which(loansData$Employment.Length == "n/a")] <- NA

# remove na records
loansData <- loansData[complete.cases(loansData),]

#update -ve funded amount to 0.
#loansData$Amount.Funded.By.Investors <- loansData$Amount.Funded.By.Investors



