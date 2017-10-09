##############################
### BIOS 6623
### Project 1
### Michaela Palumbo
### Data Checking and Cleaning
##############################

## LOAD DATASET
dat <- read.csv("~/Documents/CU AMC Fall 2017/BIOS6623/Proj1Data/hiv_6623_final.csv")
head(dat)
summary(dat)


# large dataset! - will need to get down to what we want 

# initial plans for cleaning

# only want data for subjects at time 0 (baseline) and year 2 for our question of interest
dat.02 <- subset(dat, years == 0 | years == 2, select = newid:hard_drugs)
summary(dat.02)

# we have 4 outcome measures of interest (later will do separate models for each outcome)
# AGG_MENT, AGG_PHYS, VLOAD, and LEU3N 
# we will definitely keep all these variables and year variable and subj id in our cleaned dataset
# if someone has missing data for the outcome variable drop them from the analysis for that outcome
# want to compare those who reported hard drug use vs. those who did not
# variables related to hard drug use: HASHV, HASHF, smoke (?), dkprg (alcohol ?), heropiate, idu
# need to figure out which drugs are considered hard drug use
# ask if they want to keep the type of hard drug use separate (i.e HASH, heropiate, idu) 
# or if they just want to compare if they have used any hard drugs or not (hard_drugs)?
# might have collinearity issues if include heropiate and idu with hard_drugs


dat.02wide <- reshape(data = dat.02, idvar = "newid", timevar = "years", direction = "wide")
head(dat.02wide)
summary(dat.02wide)
dropvars <- names(dat.02wide) %in% c("income.2", "DKGRP.2", "age.2", "BMI.2", "RACE.2", "SMOKE.2", 
              "EDUCBAS.2", "ADH.0", "HASHV.2", "HASHF.2", "HBP.2", "DIAB.2", "LIV34.2", "KID.2",
              "FRP.2", "FP.2", "TCHOL.2", "TRIG.2", "LDL.2", "DYSLIP.2", "CESD.2", "HEROPIATE.2",
              "IDU.2", "hivpos.2", "ART.2", "everART.2", "hard_drugs.2", "hivpos.0", "ART.0",
              "everART.0", "IDU.0", "HEROPIATE.0", "CESD.0", "HBP.0", "DIAB.0", "LIV34.0",
              "KID.0", "FRP.0", "FP.0", "TCHOL.0", "TRIG.0", "LDL.0", "DYSLIP.0", "CESD.0")

dat.02wide2 <- dat.02wide[!dropvars] # dropping variables not needed
summary(dat.02wide2)

# don't know if we want the ART or everART variables or not? (all 0s at baseline and all 1s at year 2)

# covariates commonly controlled for as told by investigator:
# baseline value of outcome, baseline age, baseline bmi, baseline race - NHW vs other, 
# baseline marijuana use, baseline alcohol use - >13 drinks/week vs 13 or less,
# baseline smoking - current vs. never/former, baseline income - < 10000, 10000-40000, >40000
# education - >HS vs HS or less, ART adherence - >95% vs <95%

# check for missing data - missing outcome values or covariate values? 
# codes for missing values
dat.02wide2$BMI.0[dat.02wide2$BMI.0 == 999] <- NA
dat.02wide2$BMI.0[dat.02wide2$BMI.0 == -1] <- NA
dat.02wide2$income.0[dat.02wide2$income.0 == 9] <- NA

# check for potential outliers or impossible values
dat.02wide2$BMI.0[dat.02wide2$BMI.0 > 100] <- NA

## recategorize category variables to investigator's preference

# race (NHW (1) vs other (2))
dat.02wide2$RACE.0[dat.02wide2$RACE.0 > 1] <- 2 

# alcohol use (> 13 vs. 13 or less)
dat.02wide2$DKGRP.0[dat.02wide2$DKGRP.0 < 3] <- 1 # 13 or less
dat.02wide2$DKGRP.0[dat.02wide2$DKGRP.0 == 3] <- 2 # >13

# smoking (current vs. former/never)
dat.02wide2$SMOKE.0[dat.02wide2$SMOKE.0 < 3] <- 1 # never/former
dat.02wide2$SMOKE.0[dat.02wide2$SMOKE.0 == 3] <- 2 # current

# income (< 10000 (1), 10000-40000 (2), >40000 (3))
dat.02wide2$income.0[dat.02wide2$income.0 > 1 & dat.02wide2$income.0 <5] <- 2
dat.02wide2$income.0[dat.02wide2$income.0 > 4] <- 3

# education (>HS vs HS or less)
dat.02wide2$EDUCBAS.0[dat.02wide2$EDUCBAS.0 < 4] <- 1 # HS or less
dat.02wide2$EDUCBAS.0[dat.02wide2$EDUCBAS.0 > 3] <- 2 # > HS

# ART adherence (>95% vs <95%)
dat.02wide2$ADH.2[dat.02wide2$ADH.2 < 3] <- 1 # >= 95%
dat.02wide2$ADH.2[dat.02wide2$ADH.2 > 2] <- 2 # < 95%

summary(dat.02wide2)

# Remove people with any missing data
dat.wide.nomissing <- dat.02wide2[complete.cases(dat.02wide2), ]
summary(dat.wide.nomissing)

# log transform viral load because investigator said log viral load is clinically meaningful
dat.wide.nomissing$log10vload.0 <- log10(dat.wide.nomissing$VLOAD.0)
dat.wide.nomissing$log10vload.2 <- log10(dat.wide.nomissing$VLOAD.2)

# create difference variables
dat.wide.nomissing$log10vloaddiff <- dat.wide.nomissing$log10vload.2 - dat.wide.nomissing$log10vload.0
dat.wide.nomissing$AGGMENTdiff <- dat.wide.nomissing$AGG_MENT.2 - dat.wide.nomissing$AGG_MENT.0
dat.wide.nomissing$AGGPHYSdiff <- dat.wide.nomissing$AGG_PHYS.2 - dat.wide.nomissing$AGG_PHYS.0
dat.wide.nomissing$LEU3Ndiff <- dat.wide.nomissing$LEU3N.2 - dat.wide.nomissing$LEU3N.0

# remove outlier I later found with LEU3Ndiff
dat.wide.nomissing$LEU3Ndiff[dat.wide.nomissing$LEU3Ndiff > 1100] <- NA
dat.wide.nomissing <- dat.wide.nomissing[complete.cases(dat.wide.nomissing), ]

# keep a copy of the dataset that is all numerical (potentially easier to load in SAS)
dat.wide.nomissing.num <- dat.wide.nomissing

# make categorical variables factors
dat.wide.nomissing$HASHV.0 <- factor(dat.wide.nomissing$HASHV.0, labels = c("no", "yes"))
dat.wide.nomissing$HASHF.0 <- factor(dat.wide.nomissing$HASHF.0)
dat.wide.nomissing$income.0 <- factor(dat.wide.nomissing$income.0, labels = c("< 10000", "10000-40000", ">40000"))
dat.wide.nomissing$SMOKE.0 <- factor(dat.wide.nomissing$SMOKE.0, labels = c("never/former", "current"))
dat.wide.nomissing$DKGRP.0 <- factor(dat.wide.nomissing$DKGRP.0, labels = c("13 or less /week", ">13 /week"))
dat.wide.nomissing$RACE.0 <- factor(dat.wide.nomissing$RACE.0, labels = c("NHW", "other"))
dat.wide.nomissing$EDUCBAS.0 <- factor(dat.wide.nomissing$EDUCBAS.0, labels = c("HS or less", "more than HS"))
# hard drug use?
dat.wide.nomissing$hard_drugs.0 <-factor(dat.wide.nomissing$hard_drugs.0, labels = c("no", "yes"))
# adherent?
dat.wide.nomissing$ADH.2 <- factor(dat.wide.nomissing$ADH.2, labels = c("yes", "no"))

summary(dat.wide.nomissing)


# creating datset for SAS and proc MCMC
# all binary need to be 0 and 1 - not 1 and 2
# need to ask: will SAS proc mcmc use the 0 as the reference? I think so but double check
summary(dat.wide.nomissing.num)
dropvarsSAS <- names(dat.wide.nomissing.num) %in% c("HASHF.0", "AGG_MENT.2", "AGG_PHYS.2",
                                            "LEU3N.2", "VLOAD.2", "VLOAD.0", "log10vload.2")

dat.SAS1 <- dat.wide.nomissing.num[!dropvarsSAS] # dropping variables not needed
# changing the binaries to 0 and 1

# remove all other datasets along the way to clean up the environment and just have SAS data
rm(list = c("dat", "dat.02", "dat.02wide", "dat.02wide2", "dat.wide.nomissing", 
            "dat.wide.nomissing.num", "dropvars", "dropvarsSAS"))


# hashv.0 (marijuana use? 0 = no, 1 = yes)
dat.SAS1$HASHV.0[dat.SAS1$HASHV.0 == 1] <- 0
dat.SAS1$HASHV.0[dat.SAS1$HASHV.0 == 2] <- 1
# smoke.0 (smoking status? 0 = never/former, 1 = current)
dat.SAS1$SMOKE.0[dat.SAS1$SMOKE.0 == 1] <- 0
dat.SAS1$SMOKE.0[dat.SAS1$SMOKE.0 == 2] <- 1
# dkgrp.0 (alcohol use? 0 = 13 or less drinks/wk, 1 = >13 drinks/wk)
dat.SAS1$DKGRP.0[dat.SAS1$DKGRP.0 == 1] <- 0
dat.SAS1$DKGRP.0[dat.SAS1$DKGRP.0 == 2] <- 1
# race.0 (0 = non-hispanic white, 1 = other)
dat.SAS1$RACE.0[dat.SAS1$RACE.0 == 1] <- 0
dat.SAS1$RACE.0[dat.SAS1$RACE.0 == 2] <- 1
# educbas.0 (0 = HS or less, 1 = more than HS)
dat.SAS1$EDUCBAS.0[dat.SAS1$EDUCBAS.0 == 1] <- 0 
dat.SAS1$EDUCBAS.0[dat.SAS1$EDUCBAS.0 == 2] <- 1
# hard_drugs.0 (already is a 0 and 1, hard drug use? 0 = no, 1 = yes)
# adh.2 (0 = adherent >95%, 1 = not adherent <95%)
dat.SAS1$ADH.2[dat.SAS1$ADH.2 == 1] <- 0
dat.SAS1$ADH.2[dat.SAS1$ADH.2 == 2] <- 1

# more than 2 levels in categorical: make more than one indicator variable
# income.0
dat.SAS1$income.0mid <- ifelse(dat.SAS1$income.0 == 2, 1, 0)
dat.SAS1$income.0high <- ifelse(dat.SAS1$income.0 == 3, 1, 0)
dat.SAS1$income.0low <- ifelse(dat.SAS1$income.0 == 1, 1, 0)

# check these are what I want
dat.SAS1[1:20, c("income.0", "income.0high", "income.0mid", "income.0low")]

# Output clean file of data to use for running PROC MCMC models in SAS
getwd()
# change working directory so the data doesn't go to files accessible by github
setwd("/Users/Michaela/Documents/CU AMC Fall 2017/BIOS6623/Proj1Data")
getwd()
write.csv(dat.SAS1, file = "Proj1SASDataClean.csv", row.names = FALSE)
