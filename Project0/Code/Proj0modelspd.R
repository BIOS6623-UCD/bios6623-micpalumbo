##########################
### BIOS 6623 Project 0
### Michaela Palumbo
### Models - Pocket Depth
##########################

## Difference in pocket depth as outcome for all models
## Only looking at AIC and residual plots

## diffpd and treatment group (simplest model)
lmpd1 <- lm(pddiff ~ trtgroup, data = dat)
summary(lmpd1)
plot(residuals(lmpd1)~fitted(lmpd1), pch = 20, main = lmpd1)
qqnorm(scale(residuals(lmpd1)), pch = 20, main = lmpd1)
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd + sites, age, race, gender, smoking status (full model)
lmpd2 <- lm(pddiff ~ trtgroup + pdbase + sites + age + race + sex + smoker, data = dat)
summary(lmpd2)
plot(residuals(lmpd2)~fitted(lmpd2), pch = 20, main = lmpd2)
qqnorm(scale(residuals(lmpd2)), pch = 20, main = lmpd2)
abline(0, 1, col = "red")

## diffpd and treatment group + sites, age, race, gender, smoking status (baselinepd removed)
lmpd3 <- lm(pddiff ~ trtgroup + sites + age + race + sex + smoker, data = dat)
summary(lmpd3)
plot(residuals(lmpd3)~fitted(lmpd3), pch = 20, main = lmpd3)
qqnorm(scale(residuals(lmpd3)), pch = 20, main = lmpd3)
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd, age, race, gender, smoking status (sites removed)
lmpd4 <- lm(pddiff ~ trtgroup + pdbase + age + race + sex + smoker, data = dat)
summary(lmpd4)
plot(residuals(lmpd4)~fitted(lmpd4), pch = 20, main = lmpd4)
qqnorm(scale(residuals(lmpd4)), pch = 20, main = lmpd4)
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd, sites, race, gender, smoking status (age removed)
lmpd5 <- lm(pddiff ~ trtgroup + pdbase + sites + race + sex + smoker, data = dat)
summary(lmpd5)
plot(residuals(lmpd5)~fitted(lmpd5), pch = 20, main = lmpd5)
qqnorm(scale(residuals(lmpd5)), pch = 20, main = lmpd5)
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd, sites, age, gender, smoking status (race removed)
lmpd6 <- lm(pddiff ~ trtgroup + pdbase + sites + age + sex + smoker, data = dat)
summary(lmpd6)
plot(residuals(lmpd6)~fitted(lmpd6), pch = 20, main = lmpd6)
qqnorm(scale(residuals(lmpd6)), pch = 20, main = lmpd6)
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd, sites, age, race, smoking status (gender remomved)
lmpd7 <- lm(pddiff ~ trtgroup + pdbase + sites + age + race + smoker, data = dat)
summary(lmpd7)
plot(residuals(lmpd7)~fitted(lmpd7), pch = 20, main = lmpd7)
qqnorm(scale(residuals(lmpd7)), pch = 20, main = lmpd7)
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd, sites, age, race, gender (smoking status removed)
lmpd8 <- lm(pddiff ~ trtgroup + pdbase + sites + age + race + sex, data = dat)
summary(lmpd8)
plot(residuals(lmpd8)~fitted(lmpd8), pch = 20, main = lmpd8)
qqnorm(scale(residuals(lmpd8)), pch = 20, main = lmpd8)
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd
lmpd9 <- lm(pddiff ~ trtgroup + pdbase, data = dat)
summary(lmpd9)
plot(residuals(lmpd9)~fitted(lmpd9), pch = 20, main = lmpd9)
qqnorm(scale(residuals(lmpd9)), pch = 20, main = lmpd9)
abline(0, 1, col = "red")

## diffpd and treatment group + sites
lmpd10 <- lm(pddiff ~ trtgroup + sites, data = dat)
summary(lmpd10)
plot(residuals(lmpd10)~fitted(lmpd10), pch = 20, main = lmpd10)
qqnorm(scale(residuals(lmpd10)), pch = 20, main = lmpd10)
abline(0, 1, col = "red")

## diffpd and treatment group + age
lmpd11 <- lm(pddiff ~ trtgroup + age, data = dat)
summary(lmpd11)
plot(residuals(lmpd11)~fitted(lmpd11), pch = 20, main = lmpd11)
qqnorm(scale(residuals(lmpd11)), pch = 20, main = lmpd11)
abline(0, 1, col = "red")

## diffpd and treatment group + race
lmpd12 <- lm(pddiff ~ trtgroup + race, data = dat)
summary(lmpd12)
plot(residuals(lmpd12)~fitted(lmpd12), pch = 20, main = lmpd12)
qqnorm(scale(residuals(lmpd12)), pch = 20, main = lmpd12)
abline(0, 1, col = "red")

## diffpd and treamtent group + gender
lmpd13 <- lm(pddiff ~ trtgroup + sex, data = dat)
summary(lmpd13)
plot(residuals(lmpd13)~fitted(lmpd13), pch = 20, main = lmpd13)
qqnorm(scale(residuals(lmpd13)), pch = 20, main = lmpd13)
abline(0, 1, col = "red")

## diffpd and treatment group + smoking status
lmpd14 <- lm(pddiff ~ trtgroup + smoker, data = dat)
summary(lmpd14)
plot(residuals(lmpd14)~fitted(lmpd14), pch = 20, main = lmpd14)
qqnorm(scale(residuals(lmpd14)), pch = 20, main = lmpd14)
abline(0, 1, col = "red")

