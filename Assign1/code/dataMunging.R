# This file is intended to be called once the data has already been loaded.

# Load in data--Uncomment for unit test.
#source("init.R")
#source("code/loadData.R")

# str(loansData)

# Reclassify interest rate as numeric
loansData$Interest.Rate <- as.numeric(sub("%","",as.character(loansData$Interest.Rate)))/100

# Reclassify loan length as numeric
loansData$Loan.Length <- as.numeric(sub(" months","", as.character(loansData$Loan.Length)))

# Reclassify debt to income ratio as numeric
loansData$Debt.To.Income.Ratio <- as.numeric(sub("%","",as.character(loansData$Debt.To.Income.Ratio)))/100

# Reclassify FICO range as a numeric (lower end of the range)
loansData$FICO.Num <- as.numeric(sub("-[0-9][0-9][0-9]","",as.character(loansData$FICO.Range)))

# Reclassify Employment Length as a numeric (years)
loansData$Employment.Length.Num[loansData$Employment.Length =="n/a"] = 0
loansData$Employment.Length.Num[loansData$Employment.Length =="< 1 year"] = 0.5
loansData$Employment.Length.Num[loansData$Employment.Length =="1 year"] = 1
loansData$Employment.Length.Num[loansData$Employment.Length =="2 years"] = 2
loansData$Employment.Length.Num[loansData$Employment.Length =="3 years"] = 3
loansData$Employment.Length.Num[loansData$Employment.Length =="4 years"] = 4
loansData$Employment.Length.Num[loansData$Employment.Length =="5 years"] = 5
loansData$Employment.Length.Num[loansData$Employment.Length =="6 years"] = 6
loansData$Employment.Length.Num[loansData$Employment.Length =="7 years"] = 7
loansData$Employment.Length.Num[loansData$Employment.Length =="8 years"] = 8
loansData$Employment.Length.Num[loansData$Employment.Length =="9 years"] = 9
loansData$Employment.Length.Num[loansData$Employment.Length =="10+ years"] = 10
