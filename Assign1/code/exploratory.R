library(ggplot2)

# Load in data
source("init.R")
source("code/loadData.R")

# Check the size of the data set; 14 cols x 2500 rows
dim(loansData)

# Get the column names
names(loansData)

#Try an exploratory plot; comes out as garbage. Need to clean the data
plot(loansData$Interest.Rate, loansData$FICO.Range)

# See if I can get a handle on the data types; not useful
summary(loansData)
str(loansData)

# See if I can get a handle on a single type of data
summary(loansData$Interest.Rate)
str(loansData$Interest.Rate)

##Convert Interest Rate to a numeric variable
tmp <- as.numeric(sub("%","",as.character(loansData$Interest.Rate)))/100
extraData <- data.frame(tmp)
head(extraData$Interest.Rate)

# Double-check the structure of the FICO score
str(loansData$FICO.Range)

# Let's see if we can't find a relation between FICO score and Interest
plot(extraData$Interest.Rate, loansData$FICO.Range)
axis(2,at=seq(1,40,by=5),labels=as.character(seq(640,825,by=25)))
dev.copy(png,'figures/plot01-InterestRate-vs-FICO-range-RAW-exploratory33.png')
dev.off()

# This plot shows a negative relation between FICO-score and interest rate, which we would expect.
# After all, the lower the score, the less trustworthy the lender, and the higher the rate.


# Let's see how interest rate varies by state
plot(loansData$State, extraData$Interest.Rate, axes=FALSE)
axis(1,at=1:51,labels=levels(loansData$State))
dev.copy(png, 'figures/plot02-InterestRate-vs-State-RAW-exploratory40.png')
dev.off()

# Let's see how interest rate varies by amount requested
plot(loansData$Amount.Requested, extraData$Interest.Rate)
dev.copy(png, 'figures/plot03-InterestRate-vs-amt-requested-exploratory40.png')
dev.off()

# Let's start plotting histograms to see what's happening
hist(as.numeric(loansData$Interest.Rate))
hist(loansData$Amount.Funded.By.Investors)
hist(loansData$Amount.Requested - loansData$Amount.Funded.By.Investors)

summary(loansData$Loan.Length)

# Boxplot for interest rate versus purchase reason. Added a line at the mean interest rate.
plot(loansData$Loan.Purpose, extraData$Interest.Rate)
abline(a=mean(extraData$Interest.Rate), b=0)

hist(as.numeric(loansData$FICO.Range))
axis(1,1:40, levels(loansData$FICO.Range))

# Plot of interest rate versus FICO score colored by loan length
str(loansData$Loan.Length)
levels(loansData$Loan.Length)
plot(extraData$Interest.Rate, loansData$FICO.Range, col=as.numeric(loansData$Loan.Length))
dev.copy(png, 'figures/plot04-FICO-score-vs-Interest-Rate-vs-length-65.png')
dev.off()

#Plot of monthly income versus FICO score
str(loansData$Monthly.Income)
plot(log10(loansData$Monthly.Income), loansData$FICO.Range)

# PLot of monthly income versus Interest Rate colored by FICO score
plot(log10(loansData$Monthly.Income), extraData$Interest.Rate, col=loansData$FICO.Range)


#Plot of Interest Rate vs State
plot(loansData$State, extraData$Interest.Rate)
plot(loansData$State)


# Plot of home ownership versus fico and interest rate.
plot(extraData$Interest.Rate, loansData$FICO.Range, col=as.numeric(loansData$Home.Ownership))


# Plot of interest rate versus debt to income ratio, colored by FICO score
qplot(extraData$Debt.To.Income.Ratio, extraData$Interest.Rate, col=as.numeric(loansData$FICO.Range))
str(loansData$Debt.To.Income.Ratio)
extraData$Debt.To.Income.Ratio <- as.numeric(sub("%","",as.character(loansData$Debt.To.Income.Ratio)))/100
head(extraData$Debt.To.Income.Ratio)


# Plot of FICO range versus interest rate colored by Employment Length
str(loansData$Employment.Length)
summary(loansData$Employment.Length)

# Plot of interest rate versus revolving balance colored by FICO score

qplot(loansData$Revolving.CREDIT.Balance, loansData$FICO.Range)

