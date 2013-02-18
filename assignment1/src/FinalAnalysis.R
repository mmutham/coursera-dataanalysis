library("lattice")
library("psych")
library("ggplot2")
library("Hmisc")

#Based on exploration analysis, it looks like loan length and amount requested 
#play a role in determining the interest rates.  And also there is a linear relationship between fico scores and interest rates
#Let us see how these factors impact interest rates along with fico scores.

summary(loansData)

# Fit all the important variable to linear model
#loan length
#amount requested
# employment length
lmAll <- lm(loansData$Interest.Rate ~ loansData$FICO.Range + loansData$Loan.Length + loansData$Amount.Requested + loansData$Employment.Length )
#pvalue < 2.2 * 10^ -16
summary(lmAll)$r.squared
confit(lmAll)

# linear model for rate and scores
lm1 <- lm(loansData$Interest.Rate ~ loansData$FICO.Range)
#pvalue <2.2 * 10^-16
summary(lm1)$r.squared
confint(lm1)
# linear model for rate and score with loan length
lm2 <- lm(loansData$Interest.Rate ~ loansData$FICO.Range + loansData$Loan.Length)
#pvalue <2.2 * 10^-16
summary(lm2)$r.squared
confint(lm2)
# linear model for rate and score with amount requested
lm3 <- lm(loansData$Interest.Rate ~ loansData$FICO.Range + loansData$Amount.Requested)
summary(lm3)$r.squared
confint(lm3)
# Based on r squared values, lm2 seems to be the best fit model and close to all variables.

# linear model for rate and score along with both loan length and amount requested
lm4 <- lm(loansData$Interest.Rate ~ loansData$FICO.Range + loansData$Amount.Requested + loansData$Loan.Length)
summary(lm4)
confint(lm4)

lm5 <- lm(loansData$Interest.Rate ~ loansData$FICO.Range + (loansData$Amount.Requested / loansData$Loan.Length))
summary(lm5)

lm2.36 <-  lm(as.numeric(loansData$Interest.Rate[loansData$Loan.Length == "36 months"]) ~ as.numeric(loansData$FICO.Range[loansData$Loan.Length == "36 months"])
lm2.60 <-  lm(loansData$Interest.Rate[loansData$Loan.Length == "60 months"] ~ loansData$FICO.Range[loansData$Loan.Length == "60 months"])

amount.requested <- 2421
xyplot(loansData$Interest.Rate ~ as.numeric(loansData$FICO.Range) | amount.requested + as.factor(loansData$Loan.Length), panel = function(x,y, ...) {
panel.xyplot(x,y,...)
fit<-lm(y~as.numeric(x))
panel.abline(fit)
},xlab="FICO Ranges from 665-659 to 830-834 (numeric)", ylab="Interest Rate (%)", main = "Interest Rate vs. FICO Range")
             