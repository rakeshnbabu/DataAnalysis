data <- read.table("movies.txt", header = TRUE, sep="\t", quote="", fill=TRUE, strip.white=TRUE, blank.lines.skip = TRUE, allowEscapes = TRUE)
head(data)
data[79,]
str(data)


reg1 <- lm(data$score ~ data$box.office)
summary(reg1)
confint(reg1, level=0.9)

reg2 <- lm(data$score ~ data$running.time)
summary(reg2)
confint(reg2)

reg3 <- lm(data$score ~ data$box.office + data$running.time)
summary(lm(data$box.office ~ data$running.time))
summary(lm(data$score ~ data$running.time))
summary(reg3)
confint(reg3)

plot(data$score, data$running.time)
data2 <- data[data$running.time < 175,]
plot(data2$score, data2$running.time)

reg4 <- lm(data2$score ~ data2$box.office + data2$running.time)
summary(reg3)
summary(reg4)
reg4
reg3
confint(reg4)


reg5 <- lm(data$score ~ data$rating + data$running.time + data$running.time * data$rating)
summary(reg5)
confint(reg5)

data(warpbreaks)

reg6 <- lm(warpbreaks$breaks ~ relevel(warpbreaks$tension, ref="H"))
confint(reg6)
anova(reg6)
var(warpbreaks$tension)
str(warpbreaks$tension)
-22.67 - -17.95
-6.77 - -2.04
