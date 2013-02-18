library("psych")
library("ggplot2")
library("Hmisc")

# plot interestrate vs fico range
plot(loansData$FICO.Range, loansData$Interest.Rate) # relationship is linear

# Let us see if it holds good for averages as well instead of range
loansData.mean.Fico.Range <- sapply(loansData$FICO.Range, function(x) {
  lowerValue <- as.numeric(substr(x, 1,3));
  upperValue <- as.numeric(substr(x, 5,7));
  (lowerValue + upperValue)/2;
})

# plot interestrate vs mean fico range
plot(loansData.mean.Fico.Range, loansData$Interest.Rate) # relationship is linear

#plot interest rate vs Amount requested
plot(loansData$Amount.Requested, loansData$Interest.Rate) # there seems to be some positive relationship here. Need to come back to this later.

#plot interest rate vs Amount funded
plot(loansData$Amount.Funded.By.Investors, loansData$Interest.Rate) # there is no clear relationship here.

#plot interest rate vs Loan length
plot(loansData$Loan.Length, loansData$Interest.Rate) # clearly 60 months loans have higher interest rates

#plot interest rate vs loan purpose
plot(loansData$Loan.Purpose, loansData$Interest.Rate) # No clear relationship but can be investigated further

#plot debttoincome ratio vs interest rate # no clear relationship
smoothScatter(loansData$Debt.To.Income.Ratio, loansData$Interest.Rate) 

#plot home ownership vs interest rate. # no clear relationship
plot(loansData$Home.Ownership, loansData$Interest.Rate)

#plot state vs interest rate. # no clear relationship
plot(loansData$State, loansData$Interest.Rate)

#plot monthly income vs interest rate
plot(loansData$Monthly.Income, loansData$Interest.Rate)
#Cannot make much sense as all the points are clustered closely. Let's apply log and see
plot(log10(loansData$Monthly.Income), loansData$Interest.Rate)
# Not much here.


#plot open credit lines vs interest rate
plot(loansData$Open.CREDIT.Lines, loansData$Interest.Rate) # not much here

#plot revolving credit balance and interest rate
plot(loansData$Revolving.CREDIT.Balance, loansData$Interest.Rate) # not much here

#plot employment length and interest rate
plot(loansData$Employment.Length, loansData$Interest.Rate) # 

#plot employment length and interest rate
plot(loansData$Employment.Length, loansData$Interest.Rate) # 

# It looks like amount requested and loan length play a role in interest rates.



