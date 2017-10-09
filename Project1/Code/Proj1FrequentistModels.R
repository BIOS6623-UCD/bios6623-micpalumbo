##############################
### BIOS 6623
### Project 1
### Michaela Palumbo
### Frequentist
##############################

## Running frequentist models to get an idea of what would be an uninformative prior distribution 
## for the beta coefficients.

# plot the distribution of the priors I've been using
test <- rnorm(415, mean = 0, sd = sqrt(1000))
hist(test)

aggmentcrude <- lm(AGGMENTdiff ~ hard_drugs.0 + AGG_MENT.0, data = dat.SAS1)
summary(aggmentcrude)
# all the estiamtes seem like they'd be ok in the priors given above
# intercept estimate is 26.6 but std. dev only 1.76 so I think it would be ok
# and it looks good in plots
29.96 + 1.96*1.76
29.6 - 1.96*1.76

aggmentfull <- lm(AGGMENTdiff ~ hard_drugs.0 + AGG_MENT.0 + HASHV.0 + income.0 + BMI.0 + SMOKE.0
                  + DKGRP.0 + RACE.0 + EDUCBAS.0 + age.0 + ADH.2, data = dat.SAS1)
summary(aggmentfull)
# intercept etimate is 19.89 and std. dev is now 4.425 so maybe the prior above is not uninformative
19.89 + 1.96*4.42
19.89 - 1.96*4.42
# don't think it makes much of a difference and that I need to change for it
# but will try running with more uninformative prior to see if it improves plots
# I don't think that improves plots and the current prior contains the whole range of possible 
# intercepts so we will keep it as an uninformative/vague prior
# all the other parameter estimates seem ok

aggphyscrude <- lm(AGGPHYSdiff ~ hard_drugs.0 + AGG_PHYS.0, data = dat.SAS1)
summary(aggphyscrude)
# everything looks ok for the crude model
# the intercept is 12.3 w/ std. dev 2.33 but think that is is ok

aggphysfull <- lm(AGGPHYSdiff ~ hard_drugs.0 + AGG_PHYS.0 + HASHV.0 + income.0 + BMI.0 + SMOKE.0
                  + DKGRP.0 + RACE.0 + EDUCBAS.0 + age.0 + ADH.2, data = dat.SAS1)
summary(aggphysfull)
# intercept estimate is 13.96 but std. dev went up to 4.105 but think it is still ok
# all other parameter estimates seem ok

log10vloadcrude <- lm(log10vloaddiff ~ hard_drugs.0 + log10vload.0, data = dat.SAS1)
summary(log10vloadcrude)
# everything looks good here

log10vloadfull <- lm(log10vloaddiff ~ hard_drugs.0 + log10vload.0 + HASHV.0 + income.0 + BMI.0 + SMOKE.0
                     + DKGRP.0 + RACE.0 + EDUCBAS.0 + age.0 + ADH.2, data = dat.SAS1)
summary(log10vloadfull)
# everything looks good here

leu3ncrude <- lm(LEU3Ndiff ~ hard_drugs.0 + LEU3N.0, data = dat.SAS1)
summary(leu3ncrude)
# these results seemed weird so made some plots
# notice there is an outlier that I didn't see on the histogram before
hist(dat.SAS1$LEU3Ndiff)
summary(dat.SAS1$LEU3Ndiff)
plot(dat.SAS1$LEU3Ndiff)
# removed outlier and run models again
leu3ncrude <- lm(LEU3Ndiff ~ hard_drugs.0 + LEU3N.0, data = dat.SAS1)
summary(leu3ncrude)
# intercept 194 and beta hard drug -196 --> need different uninformative prior
test2 <- rnorm(414, mean = 0, sd = sqrt(100000))
hist(test2)
# will use mean 0 and var = 100000 for this outcome
leu3nfull <- lm(LEU3Ndiff ~ hard_drugs.0 + LEU3N.0 + HASHV.0 + income.0 + BMI.0 + SMOKE.0
                            + DKGRP.0 + RACE.0 + EDUCBAS.0 + age.0 + ADH.2, data = dat.SAS1)
summary(leu3nfull)

test3 <- rnorm(414, mean = 0, sd = sqrt(10000))
hist(test3)
