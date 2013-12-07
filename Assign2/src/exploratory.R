## Init
setwd("../")
## Load Data
load("data/samsungData.rda")
## Data Munging
samsungData$actFac <- as.factor(samsungData$activity)

## Analysis
#First, we'll decide how to split the training and test sets.
attach(samsungData)
subjects <- unique(subject)
subjects
dim(samsungData)
training <- subset(samsungData, samsungData$subject < 24)
dim(training)
testing <- subset(samsungData, samsungData$subject > 24)
dim(testing)

#Next, we'll analyze the homogeneity of the data between test and training.
