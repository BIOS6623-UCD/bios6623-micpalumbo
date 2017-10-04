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
Creating table 1 stratified by hard drug use

10/3/17: Created indicator variables and finalized clean dataset that I wrote as a CSV to upload to SAS to use for the proc MCMC models. Ran 8 initial proc MCMC models - 2 for each outcome. 
Had to create indicator (0/1) variables for the categorical covariates because proc mcmc doesn't have a class statement. One crude that only included outcome intercept and hard drug use. One full that includes crude plus all covariates listed as of interest to investigator. Will begin by adjusting models so that we get convergence and nice plots before we begin to compare DIC and do any further model selection and removal of covariates. At first glance at DIC and plots for the first round of 8 models I fit, it seems that for each outcome DIC was lower for the full model. However, as I have the models set up and proc mcmc settings the convergence and plots looked good for crude models for all outcoomes but looked terrible for full models for all outcomes. Will need to figure out what I need to adjust to improve my diagnostic plots. 
Questions I have/things to ask in class on 10/5:
With the 0/1 variables will SAS use 0 as the reference? Did I properly code my indicators for income and how will these beta coefficients be interpreted?
Do the crude and full models have to have the same nbi and nmc as the full models to be able to compare them?
Verify what should be included in the crude model - just hard drug use, or hard drug use and baseline outcome, or hard drug use and baseline outcome and adherence?

