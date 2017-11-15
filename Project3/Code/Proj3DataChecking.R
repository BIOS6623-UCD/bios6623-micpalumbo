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



# investigators said to only include people who had 3 or more time points
# some patients only have the outcome at some visits
# so we may have different sized datasets for the different outcomes
# "pulling criteria by outcome"
# subset the dataset to only include outcome of interest and then find IDs for people with 3 or more
# and use them to keep and include in dataset

# the outcome variables are: blockR, animals, logmemI, logmemII
# the following variables have NAs: SES (4), cdr(106), blockR (1851), animals(1893), logmemI(1827),
# logmemII (1835)


## DATA CLEANING ##

# creating datasets for each outcome variable
# only including people with 3 or more outcome measurements (figure out how to do this)
# make wide format data (1 row for each person) and only have outcome variable
# identify subjects using ID who have 3 or more outcome measurements (using ncol)
# use these ids to subset dataset and keep these subjects
# maybe write a function?

# testing
table(dat$id, is.na(dat$blockR))
# gives table where true is number of missing blockR and false is number of observed blockR measures
table(dat$id, is.na(dat$blockR))[,1]
# selects the false column (i.e. number of observed blockR responses for each sub)

test <- table(dat$id, is.na(dat$blockR))[,1]
test2 <- data.frame(ID = names(test), value = test) # creates data frame with 2 columns: ID and # obs
less3id <- as.numeric(as.vector(test2[test2$value < 3, ]$ID)) # vector containing IDs for subj w/ < 3
newdat


keep3ormore <- function(df, outcome){
  numobs <- table(df$id, is.na(outcome))[,1]
  numobsdf <- data.frame(ID = names(numobs), value = numobs)
  less3id <- as.numeric(as.vector(numobsdf[numobsdf$value < 3, ]$ID))
  newdf <- subset(df, !(df$id %in% less3id))
}

## CLEANING FINAL DATA SETS TO BE USED FOR ANALYSIS ##

# blockR
# remove subj with < 3 obs
dat.br <- keep3ormore(df = dat, outcome = dat$blockR)
# remove nas from remaining subjects who had enough observations
dat.br.comp <- subset(dat.br, !(is.na(dat.br$blockR)))
# put ageonset = 1000 instead of NA for people who did not get dementia
dat.br.comp$ageonset <- ifelse(is.na(dat.br.comp$ageonset), 1000, dat.br.comp$ageonset)

# animals
# remove subj with < 3 obs
dat.an <- keep3ormore(df = dat, outcome = dat$animals)
# remove nas from remaining subjects who had enough observations
dat.an.comp <- subset(dat.an, !(is.na(dat.an$animals)))
# put ageonset = 1000 instead of NA for people who did not get dementia
dat.an.comp$ageonset <- ifelse(is.na(dat.an.comp$ageonset), 1000, dat.an.comp$ageonset)

# logmemI
# remove subj with < 3 obs
dat.lm1 <- keep3ormore(df = dat, outcome = dat$logmemI)
# remove nas from remaining subjects who had enough observations
dat.lm1.comp <- subset(dat.lm1, !(is.na(dat.lm1$logmemI))) 
# put ageonset = 1000 instead of NA for people who did not get dementia
dat.lm1.comp$ageonset <- ifelse(is.na(dat.lm1.comp$ageonset), 1000, dat.lm1.comp$ageonset)

# logmemII
# remove subj with < 3 obs
dat.lm2 <- keep3ormore(df = dat, outcome = dat$logmemII)
# remove nas from remaining subjects who had enough observations
dat.lm2.comp <- subset(dat.lm2, !(is.na(dat.lm2$logmemII)))
# put ageonset = 1000 instead of NA for people who did not get dementia
dat.lm2.comp$ageonset <- ifelse(is.na(dat.lm2.comp$ageonset), 1000, dat.lm2.comp$ageonset)

# remove extra datsets for space
rm(list = c("dat.br", "dat.an", "dat.lm1", "dat.lm2"))
