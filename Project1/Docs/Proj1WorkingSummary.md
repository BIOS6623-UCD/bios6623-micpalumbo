Project 1 Working Summary

Loaded the data and began to clean through it. Change coding for missing values. Dropped data for all time points except for baseline and year 2. Changed to wide format. Changed coding and levels for some of the categorical variables specified by ivnestigator. 

Start working on descriptive stats and plots and tables and checking model assumptions
Examining all variables individually - all seem to be normally distributed (this was after log transforming viral load and using difference variables)
Examining relationship between primary predictor (hard drug use) and the outcome - based on boxplots it there don't seem to be major differences in any of the outcomes between hard drug users and those who didn't report using hard drugs - change in CD4+ t cell count may be lower for those with hard drug use

Examining relationship between covariates and the outcomes graphically:
AggMent - change in aggment seems to be even across levels of categorical variables, scatter plots with continuous covariates don't indicate a strong association
AggPhys - change in aggphys: same observations as for change in aggment
log10vload - change in log10vload seems maybe slightly lower for those that did adhere, but for everything else seems similar
leu3n - change in cd4+ t cell count: doesn't seem to be any notable associations between change in cd4+ t cell count and continuous variables or differences between levels of categorical variables

Examining relationship between covariates and the primary predictor (hard drug use):
Looked at boxplots or crosstables (*consider going back and adding p-values for chisq to be printed or also consider making bar charts to show number in each group for hard drug users vs non hard drug users)
Similar proportions adherent vs not adherent in drug users and non drug users
Very notable differences in education level between drug users and not drug users**
Moderate difference in race between drug users and non drug users*
Not much differences in alcohol use between hard drug users vs not drug users
Differences in smoking status between drug users and non drug users**
Moderate differences in income between drug users and not drug users*
Pretty small differences in marijuana use between drug users and not
Didn't appear to be major differences in age or BMI between hard drug users and not


Examining relationship between covariates and adherence:
Similar process as above with hard drug use
Doesn't appear to be differences in age or BMI between adherent vs. not (maybe a lower BMI for those who were not adherent)
Adherence appears to be moderately different for different levels of race*
Not much difference in alcohol use between those who were and were not adherent
Not much difference in smoking status between those who were and were not adherent (maybe very small)
Not much difference in income between those who were and were not adherent (maybe very small*)
not much difference in marijuana use between those who were and were not adherent (maybe very small*)


Examining correlation between all variables 

Start running models and model selection process

Run final models and interpret results
