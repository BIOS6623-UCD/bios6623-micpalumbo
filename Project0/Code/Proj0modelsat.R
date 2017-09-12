##########################
### BIOS 6623 Project 0
### Michaela Palumbo
### Models - Attachment
##########################

## Difference in attachment as outcome for all models
## Only looking at AIC and residual plots

## diffat and treatment group (simplest model)
lmat1 <- lm(atdiff ~ trtgroup, data = dat)
AIC(lmat1)
plot(lmat1$residuals ~ lmat1$fitted.values, pch = 20, main = "lmat1")
qqnorm(scale(lmat1$residuals), pch = 20, main = "lmat1")
abline(0, 1, col = "red")

## diffat and treatment group + baselineat + sites, age, race, gender, smoking status (full model)
lmat2 <- lm(atdiff ~ trtgroup + attachbase + sites + age + race + sex + smoker, data = dat)
AIC(lmat2)
plot(lmat2$residuals ~ lmat2$fitted.values, pch = 20, main = "lmat2")
qqnorm(scale(lmat2$residuals), pch = 20, main = "lmat2")
abline(0, 1, col = "red")

## diffat and treatment group + sites, age, race, gender, smoking status (baselineat removed)
lmat3 <- lm(atdiff ~ trtgroup + sites + age + race + sex + smoker, data = dat)
AIC(lmat3)
plot(lmat3$residuals ~ lmat3$fitted.values, pch = 20, main = "lmat3")
qqnorm(scale(lmat3$residuals), pch = 20, main = "lmat3")
abline(0, 1, col = "red")

## diffat and treatment group + baselineat, age, race, gender, smoking status (sites removed)
lmat4 <- lm(atdiff ~ trtgroup + attachbase + age + race + sex + smoker, data = dat)
AIC(lmat4)
plot(lmat4$residuals ~ lmat4$fitted.values, pch = 20, main = "lmat4")
qqnorm(scale(lmat4$residuals), pch = 20, main = "lmat4")
abline(0, 1, col = "red")

## diffat and treatment group + baselineat, sites, race, gender, smoking status (age removed)
lmat5 <- lm(atdiff ~ trtgroup + attachbase + sites + race + sex + smoker, data = dat)
AIC(lmat5)
plot(lmat5$residuals ~ lmat5$fitted.values, pch = 20, main = "lmat5")
qqnorm(scale(lmat5$residuals), pch = 20, main = "lmat5")
abline(0, 1, col = "red")

## diffat and treatment group + baselineat, sites, age, gender, smoking status (race removed)
lmat6 <- lm(atdiff ~ trtgroup + attachbase + sites + age + sex + smoker, data = dat)
AIC(lmat6)
plot(lmat6$residuals ~ lmat6$fitted.values, pch = 20, main = "lmat6")
qqnorm(scale(lmat6$residuals), pch = 20, main = "lmat6")
abline(0, 1, col = "red")

## diffat and treatment group + baselineat, sites, age, race, smoking status (gender remomved)
lmat7 <- lm(atdiff ~ trtgroup + attachbase + sites + age + race + smoker, data = dat)
AIC(lmat7)
plot(lmat7$residuals ~ lmat7$fitted.values, pch = 20, main = "lmat7")
qqnorm(scale(lmat7$residuals), pch = 20, main = "lmat7")
abline(0, 1, col = "red")

## diffat and treatment group + baselineat, sites, age, race, gender (smoking status removed)
lmat8 <- lm(atdiff ~ trtgroup + attachbase + sites + age + race + sex, data = dat)
AIC(lmat8)
plot(lmat8$residuals ~ lmat8$fitted.values, pch = 20, main = "lmat8")
qqnorm(scale(lmat8$residuals), pch = 20, main = "lmat8")
abline(0, 1, col = "red")

## diffat and treatment group + baselineat
lmat9 <- lm(atdiff ~ trtgroup + attachbase, data = dat)
AIC(lmat9)
plot(lmat9$residuals ~ lmat9$fitted.values, pch = 20, main = "lmat9")
qqnorm(scale(lmat9$residuals), pch = 20, main = "lmat9")
abline(0, 1, col = "red")

## diffat and treatment group + sites
lmat10 <- lm(atdiff ~ trtgroup + sites, data = dat)
AIC(lmat10)
plot(lmat10$residuals ~ lmat10$fitted.values, pch = 20, main = "lmat10")
qqnorm(scale(lmat10$residuals), pch = 20, main = "lmat10")
abline(0, 1, col = "red")

## diffat and treatment group + age
lmat11 <- lm(atdiff ~ trtgroup + age, data = dat)
AIC(lmat11)
plot(lmat11$residuals ~ lmat11$fitted.values, pch = 20, main = "lmat11")
qqnorm(scale(lmat11$residuals), pch = 20, main = "lmat11")
abline(0, 1, col = "red")

## diffat and treatment group + race
lmat12 <- lm(atdiff ~ trtgroup + race, data = dat)
AIC(lmat12)
plot(lmat12$residuals ~ lmat12$fitted.values, pch = 20, main = "lmat12")
qqnorm(scale(lmat12$residuals), pch = 20, main = "lmat12")
abline(0, 1, col = "red")

## diffat and treamtent group + gender
lmat13 <- lm(atdiff ~ trtgroup + sex, data = dat)
AIC(lmat13)
plot(lmat13$residuals ~ lmat13$fitted.values, pch = 20, main = "lmat13")
qqnorm(scale(lmat13$residuals), pch = 20, main = "lmat13")
abline(0, 1, col = "red")

## diffat and treatment group + smoking status
lmat14 <- lm(atdiff ~ trtgroup + smoker, data = dat)
AIC(lmat14)
plot(lmat14$residuals ~ lmat14$fitted.values, pch = 20, main = "lmat14")
qqnorm(scale(lmat14$residuals), pch = 20, main = "lmat14")
abline(0, 1, col = "red")

rm(lmat1, lmat2, lmat3, lmat4, lmat5, lmat6, lmat7, lmat8, lmat10, lmat11, lmat12, lmat13, lmat14)
rm(lmpd1, lmpd13, lmpd15)
