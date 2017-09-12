##########################
### BIOS 6623 Project 0
### Michaela Palumbo
### Graphs
##########################

#useful plot showing trend of dropout across treatment groups
plot(dat.dropout$trtgroup, xlab = "treatment group", ylab = "# subjects missing at 1 year",
     main = "Trend in Participant Dropout Across Groups") 

## EXAMINING TRENDS AMONG GROUPS

# age (boxplots)
plot(dat$age ~ dat$trtgroup, xlab = "treatment group", ylab = "age",
     main = "Age Across Treatment Group")

# sites (boxplots)
plot(dat$sites ~ dat$trtgroup, xlab = "treatment group", ylab = "# sites measured",
     main = "Sites Across Treatment Group")

# race (crosstab)


# sex (crosstab)

# smoking status (crosstab)

# difference in pocket depth (boxplots)
plot(dat$pddiff ~ dat$trtgroup, xlab = "treatment group", ylab = "Change in pocket depth",
     main = "Change in Pocket Depth Across Treatment Group")

# difference in attachment (boxplots)
plot(dat$atdiff ~ dat$trtgroup, xlab = "treatment group", ylab = "Change in attachment",
     main = "Change in Attachment Across Treatment Group")

## PLOTS OF COVARIATES vs DIFFERENCE IN POCKET DEPTH
## want to check for assumptions of relationship between covariates with outcome

# sites (scatter)
plot(dat$pddiff ~ dat$sites, xlab = "sites", ylab = "change in pocket depth")

# age (scatter)
plot(dat$pddiff ~ dat$age, xlab = "age", ylab = "change in pocket depth")

# race (boxplots)
plot(dat$pddiff ~ dat$race, xlab = "race", ylab = "change in pocket depth")

# sex (boxplots)
plot(dat$pddiff ~ dat$sex, xlab = "sex", ylab = "change in pocket depth")

# smoking status (boxplots)
plot(dat$pddiff ~ dat$smoker, xlab = "smoker?", ylab = "change in pocket depth")

# PLOTS OF COVARIATES vs DIFFERENCE IN ATTACHMENT

# sites
plot(dat$atdiff ~ dat$sites, xlab = "sites", ylab = "change in attachment")

#age
plot(dat$atdiff ~ dat$age, xlab = "age", ylab = "change in attachment")

#race
plot(dat$atdiff ~ dat$race, xlab = "race", ylab = "change in attachment")

#sex
plot(dat$atdiff ~ dat$sex, xlab = "sex", ylab = "change in attachment")

#smoking status
plot(dat$atdiff ~ dat$smoker, xlab = "smoker?", ylab = "change in attachment")


