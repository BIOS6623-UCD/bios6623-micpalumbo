##############################
### BIOS 6623
### Project 1
### Michaela Palumbo
### Data Checking and Cleaning
##############################

## LOAD DATASET
dat <- read.csv("~/Documents/CU AMC Fall 2017/BIOS6623/Proj1Data/hiv_6623_final.csv")
head(dat)

# large dataset! - will need to get down to what we want 

# initial plans for cleaning

# only want data for subjects at time 0 (baseline) and year 2 for our question of interest

# we have 4 outcome measures of interest (later will do separate models for each outcome)
# AGG_MENT, AGG_PHYS, VLOAD, and CDC-4 T 
# we will definitely keep all these variables and year variable in our cleaned dataset

# ask investigator if they really do want to look at all these outcomes
# ask invesigator if there are any particular covariates of interest

# check for missing data - missing outcome values or covariate values? 
# codes for missing values

# check for levels of categorical variables