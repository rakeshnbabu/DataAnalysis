q2Con <- url("http://simplystatistics.tumblr.com/", "r")
q2Lines <- readLines(q2Con)
close(q2Con)
q2Lines

q2LinesDesired <- c(2,45,122)

nchar(q2Lines[q2LinesDesired])


download.file(url="https://spark-public.s3.amazonaws.com/dataanalysis/ss06hid.csv", destfile="quiz2_ss06hid.csv", method="curl")

q3Data <- read.csv("quiz2_ss06hid.csv")

head(q3Data)

summary(q3Data)

names(q3Data)

summary(q3Data$VAL == 24)


summary(q3Data$FES)

head(q3Data$FES)

BDS
RMS

BDS2 <- q3Data$BDS == 2

BDS3 <- q3Data$BDS == 3

RMS4 <- q3Data$RMS == 4

RMS5 <- q3Data$RMS == 5

RMS7 <- q3Data$RMS == 7


summary(BDS3 & RMS4)
summary(BDS2 & RMS5)

agricultureLogical <- (q3Data$ACR==3 & q3Data$AGS==6)

agricultureLogical

head(which(agricultureLogical))

indexes <- which(agricultureLogical)

subsetDataFrame <- q3Data[indexes,]

summary(is.na(subsetDataFrame$MRGX))

strsplit(names(q3Data), "wgtp")[123]

summary(q3Data$YBL)


housingData <- q3Data

download.file("https://spark-public.s3.amazonaws.com/dataanalysis/ss06pid.csv", "quiz2_ss06pid.csv", method="curl")

populationData <- read.csv("quiz2_ss06pid.csv")


intersect(names(housingData), names(populationData))

tmpMerge <- merge(housingData, populationData, by="SERIALNO")


summary(tmpMerge)

str(tmpMerge)

names(tmpMerge)

unique(names(tmpMerge))

length(names(tmpMerge))

length(tmpMerge[,1])
