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

keep3ormore <- function(df, outcome){
  subj <- unique(df$id)
  for(i in subj){
   # remove NAs and find # of observations (length of vector for each person) 
  }
  df$numob <- rep(numobs)
  
}

# testing
length(dat.br$age)
test <- unique(dat$id)
length(test)
test <- as.vector(test)
str(test)
tail(dat.br)
subjdattest <- subset(dat.br, id == 101 & blockR != "NA")
nrow(subjdattest)
numobs <- as.vector(NULL, mode = "numeric")
for(n in c(101, 389)){
  subjdat <- subset(dat.br, id == n & blockR != "NA") # make dataset for each subject
  # remove rows that have NAs in outcome 
  print(nrow(subjdat))
  # find length of outcome vector
  numobs[n] <- as.numeric(nrow(subjdat))
  # create vector that has # of repeated measurements for each subject
}

as.vector(unique(dat.br$id))
# repeat the numobs vector to be part of the dataframe in long format
# if numobs < 3 then drop the row
range(test)
# blockR
dat.br <- dat[, c(1, 2, 3, 4, 5, 6, 10, 11)]
summary(dat.br) # 1851 missing blockR observations

# animals
dat.an <- dat[, c(1, 2, 3, 4, 5, 7, 10, 11)]

# logmemI
dat.lm1 <- dat[, c(1, 2, 3, 4, 5, 8, 10, 11)]

# logmemII
dat.lm2 <- dat[, c(1, 2, 3, 4, 5, 9, 10, 11)]
