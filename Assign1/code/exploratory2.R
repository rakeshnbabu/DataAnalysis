library(ggplot2)

# Load in data
source("init.R")
source("code/loadData.R")
source("code/dataMunging.R")

attach(loansData)

str(loansData)


qplot(FICO.Num, Interest.Rate)

qplot(Home.Ownership, Interest.Rate)

qplot(Inquiries.in.the.Last.6.Months, Interest.Rate, col=FICO.Num)

qplot(Employment.Length.Num, Interest.Rate, col=FICO.Num)
qplot(Employment.Length.Num, FICO.Num)

qplot(Revolving.CREDIT.Balance, Interest.Rate, col=FICO.Num)
qplot(Revolving.CREDIT.Balance, FICO.Num)

qplot(Open.CREDIT.Lines, Interest.Rate, col=FICO.Num)

qplot(Monthly.Income, Interest.Rate)

qplot(Loan.Purpose, State)

qplot(Loan.Purpose)
boxplot(Interest.Rate ~ Loan.Purpose)
boxplot(Employment.Length ~ Loan.Purpose)

hist(Inquiries.in.the.Last.6.Months) 

multRegFit <- lm(Interest.Rate ~ FICO.Num + Loan.Length + Monthly.Income + Revolving.CREDIT.Balance + Inquiries.in.the.Last.6.Months + Amount.Requested)
summary(multRegFit)
layout(matrix(1:4,2,2)) 
plot(multRegFit)

plot(multRegFit$fitted.values, multRegFit$residuals)
leverage.plots(multRegFit)

png(filename = "figures/final_figure1.png", width = 500*3, height = 480, bg = "white")
par(cex.lab = 3, cex.axis = 2, cex.main = 3, font.main = 1, "mar"=c(6,5,5,6))
layout(matrix(1:3,1,3))
hist(FICO.Num, breaks=50, xlab="FICO Score", ylab="Number of Records", main="a) Distribution of FICO scores", border = "black")
plot(multRegFit, which=c(1,5), cex.main = 2, cex.id = 2, cex.caption = 2, caption = list("b) Residuals vs Fitted","", "", "", "c) Residuals vs Leverage", ""))
as.graphicsAnnot()
dev.off()



str(multRegFit)

layout(1)
mean(Interest.Rate)

plot(Loan.Purpose)
summary(Loan.Purpose)
length(loansData[,1])
1307/2500
444/2500

summary(Loan.Length)

length(loansData$Loan.Length[Loan.Length > 40])

1952/2500

summary(FICO.Range)

plot(FICO.Range)

summary(FICO.Range)

summary(FICO.Num)
