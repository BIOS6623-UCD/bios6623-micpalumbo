##############################
### BIOS 6623
### Project 1
### Michaela Palumbo
### Descriptives
##############################

# general descriptives
summary(dat.wide.nomissing)

# examining relevant variables on their own

# AGG_MENT.0
hist(dat.wide.nomissing$AGG_MENT.0, main = "AGGMENT 0")
# AGG_MENT.2
hist(dat.wide.nomissing$AGG_MENT.2, main = "AGGMENT 2")
# both look fairly normal - slightly risght skewed but nothing to adjust for
# AGG_MENTdiff
hist(dat.wide.nomissing$AGGMENTdiff, main = "AGGMENT diff")
# distribution of the difference looks normal

# AGG_PHYS diff
hist(dat.wide.nomissing$AGGPHYSdiff, main = "AGGPHYS diff") E
# looks normal

# BMI.0
hist(dat.wide.nomissing$BMI.0, main = "baseline BMI")

# LEU3N diff
hist(dat.wide.nomissing$LEU3Ndiff, main = "Leu3N diff")

# log10vload diff
hist(dat.wide.nomissing$log10vloaddiff, main = "log10vload diff")

# age.0
hist(dat.wide.nomissing$age.0, main = "age baseline")

# use either hashv or hashf - I will choose hashv
# hashv.o
# marijuana use since last visit (1 = no, 2 = yes)
table(dat.wide.nomissing$HASHV.0)

# income.0 (< 10000 (1), 10000-40000 (2), >40000 (3))
table(dat.wide.nomissing$income.0)

# smoke.0 (never/former = 1, current = 2)
table(dat.wide.nomissing$SMOKE.0)

# dkgrp.0 alcohol use measure (13 or less drinks a week = 1, more than 13 = 2)
table(dat.wide.nomissing$DKGRP.0)

# race.0 (NHW = 1, other = 2)
table(dat.wide.nomissing$RACE.0)

# educbas.0 (HS or less = 1, more than high school = 2)
table(dat.wide.nomissing$EDUCBAS.0)

# hard_drugs.0 (0 = no, 1 = yes)
table(dat.wide.nomissing$hard_drugs.0)

# adh.2 (>= 95% = 1, <95% =2)
table(dat.wide.nomissing$ADH.2)

## Relationships between primary predictor and outcomes
par(mfrow =  c(2, 2))
plot(dat.wide.nomissing$AGGMENTdiff ~ dat.wide.nomissing$hard_drugs, xlab = "hard drug use?",
     ylab = "change mental health score")
plot(dat.wide.nomissing$AGGPHYSdiff ~ dat.wide.nomissing$hard_drugs, xlab = "hard drug use?",
     ylab = "change physical health score")
plot(dat.wide.nomissing$log10vloaddiff ~ dat.wide.nomissing$hard_drugs, xlab = "hard drug use?",
     ylab = "change in log10 viral load")
plot(dat.wide.nomissing$CD4PlusTDiff ~ dat.wide.nomissing$hard_drugs, xlab = "hard drug use?",
     ylab = "change in CD4+ T Cell count")

## Relationships between covariates and outcomes
## aggmentdiff
# hashv.0
plot(dat.wide.nomissing$AGGMENTdiff ~ dat.wide.nomissing$HASHV.0, xlab = "marijuana use (1=no 2=yes)",
     ylab = "change in AGG_MENT")
# income.0
plot(dat.wide.nomissing$AGGMENTdiff ~ dat.wide.nomissing$income.0, xlab = "income",
     ylab = "change in AGG_MENT")
# bmi.0
plot(dat.wide.nomissing$AGGMENTdiff ~ dat.wide.nomissing$BMI.0, xlab = "bmi",
     ylab = "change in AGG_MENT")
# smoke.0
plot(dat.wide.nomissing$AGGMENTdiff ~ dat.wide.nomissing$SMOKE.0, xlab = "smoking status",
     ylab = "change in AGG_MENT")
# dkgrp.0
plot(dat.wide.nomissing$AGGMENTdiff ~ dat.wide.nomissing$DKGRP.0, xlab = "alcohol use",
     ylab = "change in AGG_MENT")
# race.0
plot(dat.wide.nomissing$AGGMENTdiff ~ dat.wide.nomissing$RACE.0, xlab = "race",
     ylab = "change in AGG_MENT")
# educbas.0
plot(dat.wide.nomissing$AGGMENTdiff ~ dat.wide.nomissing$EDUCBAS.0, xlab = "educationlevel",
     ylab = "change in AGG_MENT")
# age.0
plot(dat.wide.nomissing$AGGMENTdiff ~ dat.wide.nomissing$age.0, xlab = "age",
     ylab = "change in AGG_MENT")
# adh.2
plot(dat.wide.nomissing$AGGMENTdiff ~ dat.wide.nomissing$ADH.2, xlab = "adherence",
     ylab = "change in AGG_MENT")

## aggphys diff
# hashv.0
plot(dat.wide.nomissing$AGGPHYSdiff ~ dat.wide.nomissing$HASHV.0, xlab = "marijuana use (1=no 2=yes)",
     ylab = "change in AGG_PHYS")
# income.0
plot(dat.wide.nomissing$AGGPHYSdiff ~ dat.wide.nomissing$income.0, xlab = "income",
     ylab = "change in AGG_PHYS")
# bmi.0
plot(dat.wide.nomissing$AGGPHYSdiff ~ dat.wide.nomissing$BMI.0, xlab = "bmi",
     ylab = "change in AGG_PHYS")
# smoke.0
plot(dat.wide.nomissing$AGGPHYSdiff ~ dat.wide.nomissing$SMOKE.0, xlab = "smoking status",
     ylab = "change in AGG_PHYS")
# dkgrp.0
plot(dat.wide.nomissing$AGGPHYSdiff ~ dat.wide.nomissing$DKGRP.0, xlab = "alcohol use",
     ylab = "change in AGG_PHYS")
# race.0
plot(dat.wide.nomissing$AGGPHYSdiff ~ dat.wide.nomissing$RACE.0, xlab = "race",
     ylab = "change in AGG_PHYS")
# educbas.0
plot(dat.wide.nomissing$AGGPHYSdiff ~ dat.wide.nomissing$EDUCBAS.0, xlab = "educationlevel",
     ylab = "change in AGG_PHYS")
# age.0
plot(dat.wide.nomissing$AGGPHYSdiff ~ dat.wide.nomissing$age.0, xlab = "age",
     ylab = "change in AGG_PHYS")
# adh.2
plot(dat.wide.nomissing$AGGPHYSdiff ~ dat.wide.nomissing$ADH.2, xlab = "adherence",
     ylab = "change in AGG_PHYS")

## log10 vload diff
# hashv.0
plot(dat.wide.nomissing$log10vloaddiff ~ dat.wide.nomissing$HASHV.0, xlab = "marijuana use (1=no 2=yes)",
     ylab = "change in log10 vload diff")
# income.0
plot(dat.wide.nomissing$log10vloaddiff ~ dat.wide.nomissing$income.0, xlab = "income",
     ylab = "change in log10 vload diff")
# bmi.0
plot(dat.wide.nomissing$log10vloaddiff ~ dat.wide.nomissing$BMI.0, xlab = "bmi",
     ylab = "change in log10 vload diff")
# smoke.0
plot(dat.wide.nomissing$log10vloaddiff ~ dat.wide.nomissing$SMOKE.0, xlab = "smoking status",
     ylab = "change in log10 vload diff")
# dkgrp.0
plot(dat.wide.nomissing$log10vloaddiff ~ dat.wide.nomissing$DKGRP.0, xlab = "alcohol use",
     ylab = "change in log10 vload diff")
# race.0
plot(dat.wide.nomissing$log10vloaddiff ~ dat.wide.nomissing$RACE.0, xlab = "race",
     ylab = "change in log10 vload")
# educbas.0
plot(dat.wide.nomissing$log10vloaddiff ~ dat.wide.nomissing$EDUCBAS.0, xlab = "educationlevel",
     ylab = "change in log10 vload")
# age.0
plot(dat.wide.nomissing$log10vloaddiff ~ dat.wide.nomissing$age.0, xlab = "age",
     ylab = "change in log10 vload")
# adh.2
plot(dat.wide.nomissing$log10vloaddiff ~ dat.wide.nomissing$ADH.2, xlab = "adherence",
     ylab = "change in log10 vload")

## LEU3N diff
# hashv.0
plot(dat.wide.nomissing$LEU3Ndiff ~ dat.wide.nomissing$HASHV.0, xlab = "marijuana use (1=no 2=yes)",
     ylab = "change in CD4+ T cell count")
# income.0
plot(dat.wide.nomissing$LEU3Ndiff ~ dat.wide.nomissing$income.0, xlab = "income",
     ylab = "change in CD4+ T cell count")
# bmi.0
plot(dat.wide.nomissing$LEU3Ndiff ~ dat.wide.nomissing$BMI.0, xlab = "bmi",
     ylab = "change in CD4+ T cell count")
# smoke.0
plot(dat.wide.nomissing$LEU3Ndiff ~ dat.wide.nomissing$SMOKE.0, xlab = "smoking status",
     ylab = "change in CD4+ T cell count")
# dkgrp.0
plot(dat.wide.nomissing$LEU3Ndiff ~ dat.wide.nomissing$DKGRP.0, xlab = "alcohol use",
     ylab = "change in CD4+ T cell count")
# race.0
plot(dat.wide.nomissing$LEU3Ndiff ~ dat.wide.nomissing$RACE.0, xlab = "race",
     ylab = "change in CD4+ T cell count")
# educbas.0
plot(dat.wide.nomissing$LEU3Ndiff ~ dat.wide.nomissing$EDUCBAS.0, xlab = "educationlevel",
     ylab = "change in CD4+ T cell count")
# age.0
plot(dat.wide.nomissing$LEU3Ndiff ~ dat.wide.nomissing$age.0, xlab = "age",
     ylab = "change in CD4+ T cell count")
# adh.2
plot(dat.wide.nomissing$LEU3Ndiff ~ dat.wide.nomissing$ADH.2, xlab = "adherence",
     ylab = "change in CD4+ T cell count")

## Relationships between primary predictor (hard drug use) and covariates
# age (boxplot)
plot(dat.wide.nomissing$age.0 ~ dat.wide.nomissing$hard_drugs.0, xlab = "hard drug use (0=no 1=yes)",
     ylab = "age")
# bmi (boxplot)
plot(dat.wide.nomissing$BMI.0 ~ dat.wide.nomissing$hard_drugs.0, xlab = "hard drug use(0=no 1=yes)",
     ylab = "bmi")
# adh (crosstab)
library(gmodels)
CrossTable(dat.wide.nomissing$hard_drugs.0, dat.wide.nomissing$ADH.2, 
           prop.chisq = FALSE, prop.t = FALSE)
table(dat.wide.nomissing$hard_drugs.0, dat.wide.nomissing$ADH.2)

# education
CrossTable(dat.wide.nomissing$hard_drugs.0, dat.wide.nomissing$EDUCBAS.0, 
           prop.chisq = FALSE, prop.t = FALSE)
# race
CrossTable(dat.wide.nomissing$hard_drugs.0, dat.wide.nomissing$RACE.0, 
           prop.chisq = FALSE, prop.t = FALSE)

# alcohol use
CrossTable(dat.wide.nomissing$hard_drugs.0, dat.wide.nomissing$DKGRP.0, 
           prop.chisq = FALSE, prop.t = FALSE)

# smoking status
CrossTable(dat.wide.nomissing$hard_drugs.0, dat.wide.nomissing$SMOKE.0, 
           prop.chisq = FALSE, prop.t = FALSE)

# income
CrossTable(dat.wide.nomissing$hard_drugs.0, dat.wide.nomissing$income.0, 
           prop.chisq = FALSE, prop.t = FALSE)

# marijuana use
CrossTable(dat.wide.nomissing$hard_drugs.0, dat.wide.nomissing$HASHV.0, 
           prop.chisq = TRUE, prop.t = FALSE)

## Relationships between demographic covariates and adherence
# age (boxplot)
plot(dat.wide.nomissing$age ~ dat.wide.nomissing$adherence, xlab = "adherence (1=yes 2=no)",
     ylab = "age")
# bmi (boxplot)
plot(dat.wide.nomissing$BMI ~ dat.wide.nomissing$adherence, xlab = "adherence (1=yes 2=no)",
     ylab = "bmi")

# education
CrossTable(dat.wide.nomissing$adherence, dat.wide.nomissing$education, 
           prop.chisq = FALSE, prop.t = TRUE)
test <- table(dat.wide.nomissing$education, dat.wide.nomissing$adherence)
barplot(test, beside = TRUE, col = c("red", "green"))
legend("top", c("HS or less", "more than HS"), bty = "n", 
       cex = 0.9, fill = c("red", "green"))
# race
CrossTable(dat.wide.nomissing$adherence, dat.wide.nomissing$race, 
           prop.chisq = FALSE, prop.t = FALSE)
test2 <- table(dat.wide.nomissing$race, dat.wide.nomissing$adherence)
barplot(test2, beside = TRUE)

# alcohol use
CrossTable(dat.wide.nomissing$ADH.2, dat.wide.nomissing$DKGRP.0, 
           prop.chisq = FALSE, prop.t = FALSE)
test3 <- table(dat.wide.nomissing$alcohol_use, dat.wide.nomissing$adherence)
barplot(test3, beside = TRUE)

# smoking status
CrossTable(dat.wide.nomissing$ADH.2, dat.wide.nomissing$SMOKE.0, 
           prop.chisq = FALSE, prop.t = FALSE)
test4 <- table(dat.wide.nomissing$smoker, dat.wide.nomissing$adherence)
barplot(test4, beside = TRUE)

# income
CrossTable(dat.wide.nomissing$ADH.2, dat.wide.nomissing$income.0, 
           prop.chisq = FALSE, prop.t = FALSE)
test5 <- table(dat.wide.nomissing$income, dat.wide.nomissing$adherence)
barplot(test5, beside = TRUE)

# marijuana use
CrossTable(dat.wide.nomissing$ADH.2, dat.wide.nomissing$HASHV.0, 
           prop.chisq = FALSE, prop.t = FALSE)
test6 <- table(dat.wide.nomissing$marijuana_use, dat.wide.nomissing$adherence)
barplot(test6, beside = TRUE)

## Make table 1
library(tableone)
# clean variable names for table
dat.wide.nomissing$income <- dat.wide.nomissing$income.0
dat.wide.nomissing$income.0 <- NULL

dat.wide.nomissing$marijuana_use <- dat.wide.nomissing$HASHV.0
dat.wide.nomissing$HASHV.0 <- NULL
dat.wide.nomissing$HASHF.0 <- NULL

dat.wide.nomissing$BMI <- dat.wide.nomissing$BMI.0
dat.wide.nomissing$BMI.0 <- NULL

dat.wide.nomissing$smoker <- dat.wide.nomissing$SMOKE.0
dat.wide.nomissing$SMOKE.0 <- NULL

dat.wide.nomissing$alcohol_use <- dat.wide.nomissing$DKGRP.0
dat.wide.nomissing$DKGRP.0 <- NULL

dat.wide.nomissing$race <- dat.wide.nomissing$RACE.0
dat.wide.nomissing$RACE.0 <- NULL

dat.wide.nomissing$education <- dat.wide.nomissing$EDUCBAS.0
dat.wide.nomissing$EDUCBAS.0 <- NULL

dat.wide.nomissing$age <- dat.wide.nomissing$age.0
dat.wide.nomissing$age.0 <- NULL

dat.wide.nomissing$hard_drugs <- dat.wide.nomissing$hard_drugs.0
dat.wide.nomissing$hard_drugs.0 <- NULL

dat.wide.nomissing$adherence <- dat.wide.nomissing$ADH.2
dat.wide.nomissing$ADH.2 <- NULL

dat.wide.nomissing$CD4PlusTDiff <- dat.wide.nomissing$LEU3Ndiff
dat.wide.nomissing$LEU3Ndiff <- NULL


t1vars <- c("AGGMENTdiff", "AGGPHYSdiff", "log10vloaddiff", "CD4PlusTDiff", "age", "race", "income",
            "BMI", "education", "smoker", "alcohol_use", "marijuana_use", "adherence" )
tbl1 <- CreateTableOne(t1vars, strata = "hard_drugs", data = dat.wide.nomissing)
print(tbl1, test = FALSE)
tab1mat <- print(tbl1, quote = FALSE, noSpaces = TRUE, printToggle = FALSE)
getwd()
setwd("/Users/Michaela/Repositories/bios6623-micpalumbo/Project1/Reports")
write.csv(tab1mat, file = "Proj1Tab1.csv")

## model output
output <- read.csv("/Users/Michaela/Repositories/bios6623-micpalumbo/Project1/Reports/modeloutputsummary.csv")
str(output)
