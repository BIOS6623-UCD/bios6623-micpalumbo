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

install.packages('gmodels')
library(gmodels)

# race (crosstab)
CrossTable(dat$trtgroup, dat$race, prop.chisq = FALSE, prop.t = FALSE)
table(dat$trtgroup, dat$race)
table(dat.nomissing$trtgroup, dat.nomissing$race)

# sex (crosstab)
table(dat$trtgroup, dat$sex)
table(dat.nomissing$trtgroup, dat.nomissing$sex) 
#note the difference in frequency between males and females for certain treatment groups is worse after 
#dropout - especially: controls, med, and high

# smoking status (crosstab)
table(dat$trtgroup, dat$smoker)
table(dat.nomissing$trtgroup, dat.nomissing$smoker)

# difference in pocket depth (boxplots)
plot(dat.nomissing$pddiff ~ dat.nomissing$trtgroup, xlab = "treatment group", 
     ylab = "Change in pocket depth", main = "Change in Pocket Depth Across Treatment Group")

# difference in attachment (boxplots)
plot(dat.nomissing$atdiff ~ dat.nomissing$trtgroup, xlab = "treatment group", 
     ylab = "Change in attachment", main = "Change in Attachment Across Treatment Group")

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

install.packages("tableone")
library(tableone)
t1vars <- c("age", "sex", "race", "smoker", "sites", "attachbase", "atdiff", "pdbase", "pddiff")
tbl1 <- CreateTableOne(t1vars, strata = "trtgroup", data = dat.nomissing, test = FALSE)
print(tbl1, quote = FALSE)
tab1mat <- print(tbl1, quote = FALSE, noSpaces = TRUE, printToggle = FALSE)
write.csv(tab1mat, file = "Proj0Tab1.csv")

