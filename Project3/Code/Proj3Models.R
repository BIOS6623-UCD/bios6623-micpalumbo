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

# try to make function like Camille's example to search for change point and fit model
# also trying to do what they did in the Hall paper
cps <- seq(from = 0, to = 10, by = 0.1)

cp.SearchAndFit <- function(id, y, t1, to, v1, v2, v3, cps){
  
  # create empty df to store likelihood values from the search for the changepoint
  ll <- data.frame(ChangePoint = rep(NA, length(cps)), llval = rep(NA, length(cps)))
  
  # search the data for the change point
  for(i in 1:length(cps)){
    cp <- cps[i]
    t2 <- ifelse(to - t1 >= cp, 0, t1 - to + cp)
    ChangePointMod <- lme(y ~ t1 + v1 + t1:v1 + v2 + v3 + t2, random = ~1 | id, method = 'ML')
    ll[i, ] <- c(cp, logLik(ChangePointMod))
  }
  
  # plot log likelihood
  plot(ll$ChangePoint, ll$llval, type = 'l', xlab = 'Change Point', ylab = 'Log Likelihood')
  
  # maximize the likelihood to identify the change point
  cphat <- ll[which(ll$llval == max(ll$llval)), 'ChangePoint']
  
  # add reference line to plot
  abline(v = cphat, lty = 2, lwd = 2, col = "red")
  
  # fit final model with change point mle included
  t2 <- ifelse(to - t1 >= cphat, 0, t1 - to + cphat)
  finalmod <- lme(y ~ t1 + v1 + t1:v1 + v2 + v3 + t2, random = ~ 1 | id, method = 'ML')
  
  # have function output list containing the change point identified and model results
  return(list(cp = cphat, model = finalmod))
}


## RUN CHANGE POINT MODELS FOR ANIMALS OUTCOME ##

mod <- cp.SearchAndFit(id = dat.final$id, y = dat.final$animals, t1 = dat.final$age, 
                       to = dat.final$ageonset, v1 = dat.final$demind, v2 = dat.final$gender,
                       v3 = dat.final$SES, cps = cps)
mod
summary(mod$model)
coeff <- mod$model$coefficients$fixed
coeff

## ESTIMATES OF INTEREST ##
library(multcomp)

# estimated rate of decline for those without dementia diagnosis 
confint(glht(mod$model, matrix(c(0, 1, 0, 0, 0, 0, 0), nrow=1))) # -0.1776 

# estimated rate of decline for those with dementia before change point
# this is the slope you'd compare to those without dementia if interested
confint(glht(mod$model, matrix(c(0, 1, 0, 0, 0, 0, 1), nrow=1))) # -0.17965

# estimated rate of decline for those with dementia after change point
confint(glht(mod$model, matrix(c(0, 1, 0, 0, 0, 1, 1), nrow=1))) # -1.0866

# estimated difference between slope before and after change point in those with dem
confint(glht(mod$model, matrix(c(0, 0, 0, 0, 0, 1, 0), nrow=1))) # -0.9070

# estimated difference between slope of those without dem compared to those with dem before cp
confint(glht(mod$model, matrix(c(0, 0, 0, 0, 0, 0, 1), nrow=1))) # -0.002003


## Now try to write the function that has bootstrap estimates of standard errors & CI for cphat ##
# mimicking code from Camille's bootstrap example

set.seed(1234)

boot.function<-function(id = dat.final$id, dat=dat.final, cps=cps){
  #Step 1: Get a bootstrap sample of subjects (not observations!!)
  idu <- unique(dat.final$id)
  boot.subjects <- sample(idu, length(idu), replace=T)
  
  # Now get the data (observations) for each of the chosen subjects from bootstrap sample 
  boot.dat<-NULL
  for (i in 1:length(idu)){ temp<-cbind(i, dat[id == boot.subjects[i],])
  boot.dat <- rbind(boot.dat, temp)
  }
  
  #Step 2: Repeat the analysis on the bootstrap sample
  boot.model <-cp.SearchAndFit(id = boot.dat$i, y = boot.dat$animals, t1 = boot.dat$age, 
                               to = boot.dat$ageonset, v1 = boot.dat$demind, v2 = boot.dat$gender,
                               v3 = boot.dat$SES, cps = cps)
  
  
  #Step 3: Save the estimates and CP's
  
  boot.rslt <- c(boot.model$cp,
                 confint(glht(boot.model$model, matrix(c(0, 1, 0, 0, 0, 0, 0), nrow=1)))$confint[1],
                 confint(glht(boot.model$model, matrix(c(0, 1, 0, 0, 0, 0, 1), nrow=1)))$confint[1],
                 confint(glht(boot.model$model, matrix(c(0, 1, 0, 0, 0, 1, 1), nrow=1)))$confint[1],
                 confint(glht(boot.model$model, matrix(c(0, 0, 0, 0, 0, 1, 0), nrow=1)))$confint[1],
                 confint(glht(boot.model$model, matrix(c(0, 0, 0, 0, 0, 0, 1), nrow=1)))$confint[1])
  names(boot.rslt) <- c("ChangePoint", "No_Dementia_Slope", "Dementia_Slope_BeforeCP", "Dementia_Slope_AfterCP")
  
  return(boot.rslt)
}

#Step 4: Repeat many times

niter <- 1000

bootstraps <- matrix(NA, ncol = 6, nrow = niter)
for (j in 687:niter){bootstraps[j,]<-boot.function(id = dat.final$id, dat=dat.final, cps=cps)
}

#Step 5:Inspect the bootstrap distributions

# Change Point
# hist(bootstraps[,1], xlab="Change Point", main='Bootstrap Distribution of Change Points')
# lines(c(cp,cp), c(0,1000), col='red')
# lines(c(mean(bootstraps[,1]),mean(bootstraps[,1])), c(0,1000))

mean(bootstraps[,1])
sd(bootstraps[,1]) # 0.6237
quantile(bootstraps[,1], c(0.025, 0.975)) # (3.0, 5.4)

# Slope Estimate Subjects Without Dementia
# hist(bootstraps[,2], xlab="No Dementia Slope", main='Bootstrap Estimates of No Dementia Slope')
# lines(c(-3.3010,-3.3010), c(0,1000), col='red')
# lines(c(mean(bootstraps[,2]),mean(bootstraps[,2])), c(0,1000))

mean(bootstraps[,2])
sd(bootstraps[,2]) # 0.0251
quantile(bootstraps[,2], c(0.025, 0.975)) # (-0.2274, -0.1284)

#Get percentile CI's for other estimates of interest
quantile(bootstraps[,3], c(0.025, 0.975)) # (-0.3293, 0.0042)
sd(bootstraps[, 3]) # 0.0819
quantile(bootstraps[,4], c(0.025, 0.975)) # (-1.3277, -0.8790)
sd(bootstraps[, 4]) # 0.1187
quantile(bootstraps[, 5], c(0.025, 0.975)) # (-1.2382, -0.6349)
sd(bootstraps[, 5]) # 0.1587
quantile(bootstraps[, 6], c(0.025, 0.975)) # (-0.1444, 0.1942)
sd(bootstraps[, 6]) # 0.0850

# Calculating t statistics
t2 <- -0.1776/0.0251
t3 <- -0.1797/0.0819
t4 <- -1.0866/0.1187
t5 <- -0.907/0.1587
t6 <- -0.002/0.085

# Calculating p-values
pt(t2, df = 1264) #<0.0001
pt(t3, df = 1264) # 0.0142
pt(t4, df = 1264) # < 0.0001
pt(t5, df = 1264) # <0.0001
pt(t6, df = 1264) # 0.4906
