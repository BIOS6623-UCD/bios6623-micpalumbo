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

# sites (boxplots)

# race (crosstab)

# sex (crosstab)

# smoking status (crosstab)

# difference in pocket depth (boxplots)

# difference in attachment (boxplots)

## PLOTS OF COVARIATES vs DIFFERENCE IN POCKET DEPTH
## want to check for assumptions of relationship between covariates with outcome

# sites (scatter)
plot(dat$pddiff ~ dat$sites)

# age (scatter)

# race (boxplots)

# treatment group (boxplots)

# sex (boxplots)

# smoking status (boxplots)

# PLOTS OF COVARIATES vs DIFFERENCE IN ATTACHMENT