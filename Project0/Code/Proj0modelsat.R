##########################
### BIOS 6623 Project 0
### Michaela Palumbo
### Models - Attachment
##########################

## Difference in attachment as outcome for all models
## Only looking at AIC and residual plots

## diffat and treatment group (simplest model)
lmat1 <- lm(atdiff ~ trtgroup, data = dat)
summary(lmat1)
plot(residuals(lmat1)~fitted(lmat1), pch = 20, main = lmat1)
qqnorm(scale(residuals(lmat1)), pch = 20, main = lmat1)
abline(0, 1, col = "red")

## diffat and treatment group + baselineat + sites, age, race, gender, smoking status (full model)
lmat2 <- lm(atdiff ~ trtgroup + attachbase + sites + age + race + sex + smoker, data = dat)
summary(lmat2)
plot(residuals(lmat2)~fitted(lmat2), pch = 20, main = lmat2)
qqnorm(scale(residuals(lmat2)), pch = 20, main = lmat2)
abline(0, 1, col = "red")

## diffat and treatment group + sites, age, race, gender, smoking status (baselineat removed)
lmat3 <- lm(atdiff ~ trtgroup + sites + age + race + sex + smoker, data = dat)
summary(lmat3)
plot(residuals(lmat3)~fitted(lmat3), pch = 20, main = lmat3)
qqnorm(scale(residuals(lmat3)), pch = 20, main = lmat3)
abline(0, 1, col = "red")

## diffat and treatment group + baselineat, age, race, gender, smoking status (sites removed)
lmat4 <- lm(atdiff ~ trtgroup + attachbase + age + race + sex + smoker, data = dat)
summary(lmat4)
plot(residuals(lmat4)~fitted(lmat4), pch = 20, main = lmat4)
qqnorm(scale(residuals(lmat4)), pch = 20, main = lmat4)
abline(0, 1, col = "red")

## diffat and treatment group + baselineat, sites, race, gender, smoking status (age removed)
lmat5 <- lm(atdiff ~ trtgroup + attachbase + sites + race + sex + smoker, data = dat)
summary(lmat5)
plot(residuals(lmat5)~fitted(lmat5), pch = 20, main = lmat5)
qqnorm(scale(residuals(lmat5)), pch = 20, main = lmat5)
abline(0, 1, col = "red")

## diffat and treatment group + baselineat, sites, age, gender, smoking status (race removed)
lmat6 <- lm(atdiff ~ trtgroup + attachbase + sites + age + sex + smoker, data = dat)
summary(lmat6)
plot(residuals(lmat6)~fitted(lmat6), pch = 20, main = lmat6)
qqnorm(scale(residuals(lmat6)), pch = 20, main = lmat6)
abline(0, 1, col = "red")

## diffat and treatment group + baselineat, sites, age, race, smoking status (gender remomved)
lmat7 <- lm(atdiff ~ trtgroup + attachbase + sites + age + race + smoker, data = dat)
summary(lmat7)
plot(residuals(lmat7)~fitted(lmat7), pch = 20, main = lmat7)
qqnorm(scale(residuals(lmat7)), pch = 20, main = lmat7)
abline(0, 1, col = "red")

## diffat and treatment group + baselineat, sites, age, race, gender (smoking status removed)
lmat8 <- lm(atdiff ~ trtgroup + attachbase + sites + age + race + sex, data = dat)
summary(lmat8)
plot(residuals(lmat8)~fitted(lmat8), pch = 20, main = lmat8)
qqnorm(scale(residuals(lmat8)), pch = 20, main = lmat8)
abline(0, 1, col = "red")

## diffat and treatment group + baselineat
lmat9 <- lm(atdiff ~ trtgroup + attachbase, data = dat)
summary(lmat9)
plot(residuals(lmat9)~fitted(lmat9), pch = 20, main = lmat9)
qqnorm(scale(residuals(lmat9)), pch = 20, main = lmat9)
abline(0, 1, col = "red")

## diffat and treatment group + sites
lmat10 <- lm(atdiff ~ trtgroup + sites, data = dat)
summary(lmat10)
plot(residuals(lmat10)~fitted(lmat10), pch = 20, main = lmat10)
qqnorm(scale(residuals(lmat10)), pch = 20, main = lmat10)
abline(0, 1, col = "red")

## diffat and treatment group + age
lmat11 <- lm(atdiff ~ trtgroup + age, data = dat)
summary(lmat11)
plot(residuals(lmat11)~fitted(lmat11), pch = 20, main = lmat11)
qqnorm(scale(residuals(lmat11)), pch = 20, main = lmat11)
abline(0, 1, col = "red")

## diffat and treatment group + race
lmat12 <- lm(atdiff ~ trtgroup + race, data = dat)
summary(lmat12)
plot(residuals(lmat12)~fitted(lmat12), pch = 20, main = lmat12)
qqnorm(scale(residuals(lmat12)), pch = 20, main = lmat12)
abline(0, 1, col = "red")

## diffat and treamtent group + gender
lmat13 <- lm(atdiff ~ trtgroup + sex, data = dat)
summary(lmat13)
plot(residuals(lmat13)~fitted(lmat13), pch = 20, main = lmat13)
qqnorm(scale(residuals(lmat13)), pch = 20, main = lmat13)
abline(0, 1, col = "red")

## diffat and treatment group + smoking status
lmat14 <- lm(atdiff ~ trtgroup + smoker, data = dat)
summary(lmat14)
plot(residuals(lmat14)~fitted(lmat14), pch = 20, main = lmat14)
qqnorm(scale(residuals(lmat14)), pch = 20, main = lmat14)
abline(0, 1, col = "red")
