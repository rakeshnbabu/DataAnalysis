data(warpbreaks)
library(glm2)
data(crabs)
#q1
q1m <- lm(warpbreaks$breaks ~ warpbreaks$wool + warpbreaks$tension)

q1anova <- anova(q1m)
summary(q1anova)
q1anova

#q2
log(0.2/0.8)

#q3
attach(crabs)
q3lm <- glm(Satellites ~ Width, family=poisson())
q3lm

#q4
str(crabs)
plot(jitter(as.integer(Width)), Satellites)
exp(-3.305 + 0.164 * 22)

#q5
library(MASS)
data(quine)
attach(quine)
str(quine)
lm1 <- lm(log(Days + 2.5) ~ ., data=quine)
step(lm1)
