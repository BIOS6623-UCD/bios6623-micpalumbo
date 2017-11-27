##############################
### BIOS 6623 
### Project 3
### Michaela Palumbo
### Data Checking and Cleaning
##############################


## LOAD DATA ##
dat <- read.csv("~/Documents/CU AMC Fall 2017/BIOS6623/Project3Data.csv")
head(dat)
summary(dat)

## DATA CHECKING ##

# Examining each variable on its own

# age
hist(dat$age)
plot(dat$age)
# how many people are older than 100
nrow(subset(dat, age>100))
# 55 rows but there are repeated measurements on subjects
testages <- subset(dat, age > 100)
length(unique(testages$id)) # only 11 people are over 100 - not concerning

# gender (1=male, 2=female)
dat$gender <- factor(dat$gender, levels = c(1,2), labels = c("male", "female"))
table(dat$gender)

# SES
hist(dat$SES)
plot(dat$SES)

# cdr
hist(dat$cdr)
plot(dat$cdr)
# potentially categorize

# blockR
hist(dat$blockR)
plot(dat$blockR)
# looks normal

# animals
hist(dat$animals)
plot(dat$animals)
# looks normal

# logmemI
hist(dat$logmemI)
plot(dat$logmemI)
# looks pretty normal

# logmemII
hist(dat$logmemII)
plot(dat$logmemII)
# seems to have a clump of low values that make it look bimodal rather than normal - ask investigators

# ageonset
hist(dat$ageonset)
plot(dat$ageonset)
# mostly normal.. a little weird looking but ok

# demind (dementia diagnosis? 1 = yes, 0 = no)
dat$demind <- factor(dat$demind, levels = c(0, 1), labels = c("no", "yes"))
table(dat$demind)

# Identify how many unique subjects there are (# independent sampling units)
length(unique(dat$id)) # 216 subjects


## DATA CLEANING ##

# function to only keep subjects with 3 or more outcome measurements
keep3ormore <- function(df, outcome){
  numobs <- table(df$id, is.na(outcome))[,1]
  numobsdf <- data.frame(ID = names(numobs), value = numobs)
  less3id <- as.numeric(as.vector(numobsdf[numobsdf$value < 3, ]$ID))
  newdf <- subset(df, !(df$id %in% less3id))
}

## CLEANING FINAL DATA SET TO BE USED FOR ANALYSIS ##

# remove subj with < 3 animals obs
dat.final <- keep3ormore(df = dat, outcome = dat$animals)

# how many subjects are remaining?
length(unique(dat.final$id)) # 187

# remove nas from remaining subjects who had enough observations
dat.final <- subset(dat.final, !(is.na(dat.final$animals)))
# make sure we still have the same number of subjects
length(unique(dat.final$id)) # yes 187 subjects, 1454 observations total

# remove outcome variables that won't be used
dat.final <- subset(dat.final, select = -c(blockR, logmemI, logmemII, cdr))

## DESCRIPTIVE STATS FOR ANALYTIC DATASET ##

## stats for Table 1
## stratify by demind

## subset of data with just patients diagnosed ##
dempats <- subset(dat.final, demind == "yes")
summary(dempats)
# 586 observations
length(unique(dempats$id)) #68 patients
# baseline SES
mean(dempats$SES)
sd(dempats$SES)
# proportion of females
dempats.fem <- subset(dempats, gender == "female")
length(unique(dempats.fem$id))/length(unique(dempats$id))*100
# average number of measurements
nummeas.di <- aggregate(x = dempats$animals, by = list(factor(dempats$id)), FUN = length)
mean(nummeas.di$x) 
sd(nummeas.di$x)
# average baseline age
baseage.di <- aggregate(x = dempats$age, by = list(factor(dempats$id)), FUN = min)
mean(baseage.di$x)
sd(baseage.di$x)
# average time followed
tfollow.di <- aggregate(x = dempats$age, by = list(factor(dempats$id)), FUN = function(x){max(x) - min(x)})
mean(tfollow.di$x)
sd(tfollow.di$x)
# average age onset
mean(dempats$ageonset)
sd(dempats$ageonset)
# average baseline animals
basean.di <- aggregate(x = dempats$animals, by = list(factor(dempats$id)), FUN = function(x){x[1]})
mean(basean.di$x)
sd(basean.di$x)
# average animals at last visit
lastan.di <- aggregate(x = dempats$animals, by = list(factor(dempats$id)), FUN = function(x){x[length(x)]})
mean(lastan.di$x)
sd(lastan.di$x)

## subset of data with patients not diagnosed ##
demno <- subset(dat.final, demind == "no")
summary(demno)
# 868 observations
length(unique(demno$id)) #119 patients
# baseline SES
mean(demno$SES)
sd(demno$SES)
# proportion of females
demno.fem <- subset(demno, gender == "female")
length(unique(demno.fem$id))/length(unique(demno$id))*100
# average number of measurements
nummeas.no <- aggregate(x = demno$animals, by = list(factor(demno$id)), FUN = length)
mean(nummeas.no$x) 
sd(nummeas.no$x)
# average baseline age
baseage.no <- aggregate(x = demno$age, by = list(factor(demno$id)), FUN = min)
mean(baseage.no$x)
sd(baseage.no$x)
# average time followed
tfollow.no <- aggregate(x = demno$age, by = list(factor(demno$id)), FUN = function(x){max(x) - min(x)})
mean(tfollow.no$x)
sd(tfollow.no$x)
# average baseline animals
basean.no <- aggregate(x = demno$animals, by = list(factor(demno$id)), FUN = function(x){x[1]})
mean(basean.no$x)
sd(basean.no$x)
# average animals at last visit
lastan.no <- aggregate(x = demno$animals, by = list(factor(demno$id)), FUN = function(x){x[length(x)]})
mean(lastan.no$x)
sd(lastan.no$x)


## FINAL CLEANING FOR MODEL RUNNING = RECODE NAS ##
# put ageonset = 999 instead of NA for people who did not get dementia
# this will be important for making function work for model
# so that there is only a change point term for people with dementia diagnosis
dat.final$ageonset <- ifelse(is.na(dat.final$ageonset), 999, dat.final$ageonset)




