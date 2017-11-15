##############################
### BIOS 6623 
### Project 3
### Michaela Palumbo
### Models
##############################

# investigators want to include gender and SES as covariates in models
# separate mixed models for each outcome
library(nlme)
# need to search for change point


## INITIAL ATTMEPTS ##
# what mixed model would look like without the change point
# blockR as example looking at fixed effects with random intercept
# do I need an interaction for age*demind or does the random int take care of that?
# do we care about ML vs REML?
blockRtest <- lme(blockR ~ age + demind + gender + SES, random = ~ 1 | id, data = dat.br.comp, method = "ML")
summary(blockRtest)

# try to make function like Camille's example to search for change point and fit model
# also trying to do what they did in the Hall paper
cps <- seq(from = 0, to = 10, by = 1)

cp.SearchAndFit <- function(id, t1, to, v1, v2, v3, y, cps){
  
  # create empty df to store likelihood values from the search for the changepoint
  ll <- data.frame(ChangePoint = rep(NA, length(cps)), llval = rep(NA, length(cps)))
  
  # search the data for the change point
  for(i in 1:length(cps)){
    cp <- cps[i]
    # t2 is variable that = 0 when age at onset - age is greater than the cp and equals the diff + cp
    # when greater
    t2 <- ifelse(to - t1 < cp, tl - to + cp, 0)
    ChangePointMod <- lme(y ~ t1 + t2 + v1 + v2 + v3, random = ~1 | id, method = 'ML')
    ll[i, ] <- c(cp, logLik(ChangePointMod))
  }
  
  # plot log likelihood
  plot(ll$ChangePoint, ll$llval, type = 'l', xlab = 'Change Point (months', ylab = 'Log Likelihood')
  
  # maximize the likelihood to identify the change point
  cp <- ll[which(ll$llval == max(ll$llval)), 'ChangePoint']
  
  # fit model with change point included
  t2 <- ifelse(to - t1 < cp, t1 - to + cp, 0)
  finalmod <- lme(y ~ t1 + t2 + v1 + v2 + v3, random = ~ 1 | id, method = 'ML')
  
  # have function output list containing the change point identified and model results
  return(list(cp = cp, model = finalmod))
}


## RUN CHANGE POINT MODELS FOR EACH OUTCOME ##

## blockR model

## animals model

## logmemI model

## logmemII model