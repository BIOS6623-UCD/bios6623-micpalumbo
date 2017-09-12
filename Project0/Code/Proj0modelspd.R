##########################
### BIOS 6623 Project 0
### Michaela Palumbo
### Models - Pocket Depth
##########################

## Difference in pocket depth as outcome for all models
## Only looking at AIC and residual plots

## diffpd and treatment group (simplest model)
lmpd1 <- lm(pddiff ~ trtgroup, data = dat)
AIC(lmpd1)
plot(lmpd1$residuals ~ lmpd1$fitted.values, pch = 20, main = "lmpd1")
qqnorm(scale(lmpd1$residuals), pch = 20, main = "lmpd1")
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd + sites, age, race, gender, smoking status (full model)
lmpd2 <- lm(pddiff ~ trtgroup + pdbase + sites + age + race + sex + smoker, data = dat)
AIC(lmpd2)
plot(lmpd2$residuals ~ lmpd2$fitted.values, pch = 20, main = "lmpd2")
qqnorm(scale(lmpd2$residuals), pch = 20, main = "lmpd2")
abline(0, 1, col = "red")

## diffpd and treatment group + sites, age, race, gender, smoking status (baselinepd removed)
lmpd3 <- lm(pddiff ~ trtgroup + sites + age + race + sex + smoker, data = dat)
AIC(lmpd3)
plot(lmpd3$residuals ~ lmpd3$fitted.values, pch = 20, main = "lmpd3")
qqnorm(scale(lmpd3$residuals), pch = 20, main = "lmpd3")
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd, age, race, gender, smoking status (sites removed)
lmpd4 <- lm(pddiff ~ trtgroup + pdbase + age + race + sex + smoker, data = dat)
AIC(lmpd4)
plot(lmpd4$residuals~lmpd4$fitted.values, pch = 20, main = "lmpd4")
qqnorm(scale(residuals(lmpd4)), pch = 20, main = "lmpd4")
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd, sites, race, gender, smoking status (age removed)
lmpd5 <- lm(pddiff ~ trtgroup + pdbase + sites + race + sex + smoker, data = dat)
AIC(lmpd5)
plot(lmpd5$residuals ~ lmpd5$fitted.values, pch = 20, main = "lmpd5")
qqnorm(scale(lmpd5$residuals), pch = 20, main = "lmpd5")
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd, sites, age, gender, smoking status (race removed)
lmpd6 <- lm(pddiff ~ trtgroup + pdbase + sites + age + sex + smoker, data = dat)
AIC(lmpd6)
plot(lmpd6$residuals ~ lmpd6$fitted.values, pch = 20, main = "lmpd6")
qqnorm(scale(lmpd6$residuals), pch = 20, main = "lmpd6")
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd, sites, age, race, smoking status (gender remomved)
lmpd7 <- lm(pddiff ~ trtgroup + pdbase + sites + age + race + smoker, data = dat)
AIC(lmpd7)
plot(lmpd7$residuals ~ lmpd7$fitted.values, pch = 20, main = "lmpd7")
qqnorm(scale(lmpd7$residuals), pch = 20, main = "lmpd7")
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd, sites, age, race, gender (smoking status removed)
lmpd8 <- lm(pddiff ~ trtgroup + pdbase + sites + age + race + sex, data = dat)
AIC(lmpd8)
plot(lmpd8$residuals ~ lmpd8$fitted.values, pch = 20, main = "lmpd8")
qqnorm(scale(lmpd8$residuals), pch = 20, main = "lmpd8")
abline(0, 1, col = "red")

## diffpd and treatment group + baselinepd
lmpd9 <- lm(pddiff ~ trtgroup + pdbase, data = dat)
AIC(lmpd9)
plot(lmpd9$residuals ~ lmpd9$fitted.values, pch = 20, main = "lmpd9")
qqnorm(scale(lmpd9$residuals), pch = 20, main = "lmpd9")
abline(0, 1, col = "red")

## diffpd and treatment group + sites
lmpd10 <- lm(pddiff ~ trtgroup + sites, data = dat)
AIC(lmpd10)
plot(lmpd10$residuals ~ lmpd10$fitted.values, pch = 20, main = "lmpd10")
qqnorm(scale(lmpd10$residuals), pch = 20, main = "lmpd10")
abline(0, 1, col = "red")

## diffpd and treatment group + age
lmpd11 <- lm(pddiff ~ trtgroup + age, data = dat)
AIC(lmpd11)
plot(lmpd11$residuals ~ lmpd11$fitted.values, pch = 20, main = "lmpd11")
qqnorm(scale(lmpd11$residuals), pch = 20, main = "lmpd11")
abline(0, 1, col = "red")

## diffpd and treatment group + race
lmpd12 <- lm(pddiff ~ trtgroup + race, data = dat)
AIC(lmpd12)
plot(lmpd12$residuals ~ lmpd12$fitted.values, pch = 20, main = "lmpd12")
qqnorm(scale(lmpd12$residuals), pch = 20, main = "lmpd12")
abline(0, 1, col = "red")

## diffpd and treamtent group + gender
lmpd13 <- lm(pddiff ~ trtgroup + sex, data = dat)
AIC(lmpd13)
plot(lmpd13$residuals ~ lmpd13$fitted.values, pch = 20, main = "lmpd13")
qqnorm(scale(lmpd13$residuals), pch = 20, main = "lmpd13")
abline(0, 1, col = "red")

## diffpd and treatment group + smoking status
lmpd14 <- lm(pddiff ~ trtgroup + smoker, data = dat)
AIC(lmpd14)
plot(lmpd14$residuals ~ lmpd14$fitted.values, pch = 20, main = "lmpd14")
qqnorm(scale(lmpd14$residuals), pch = 20, main = "lmpd14")
abline(0, 1, col = "red")

# models 1, 9, and 13 had lowest AIC so try model below
## diffpd and treatment group + baseline + gender
lmpd15 <- lm(pddiff ~ trtgroup + pdbase + sex, data = dat)
AIC(lmpd15)
plot(lmpd15$residuals ~ lmpd15$fitted.values, pch = 20, main = "lmpd15")
qqnorm(scale(lmpd15$residuals), pch = 20, main = "lmpd15")
abline(0, 1, col = "red")

rm(lmpd2, lmpd3, lmpd4, lmpd5, lmpd6, lmpd7, lmpd8,lmpd10, lmpd11, lmpd12, lmpd14)

