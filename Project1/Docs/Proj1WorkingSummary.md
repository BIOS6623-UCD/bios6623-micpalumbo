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
With the 0/1 variables will SAS use 0 as the reference? Did I properly code my indicators for income and how will these beta coefficients be interpreted? Yes!
Do the crude and full models have to have the same nbi and nmc as the full models to be able to compare them? No, but once get the full models to look good might want to make the crude match so that when you describe the simulations you can just say "all chains were run..." instead of specifying how different models were run
Keep baseline in crude models!!
Plot the prior to see that it actually includes a range that is reasonable for the variable (mean = 0  and var = 1000 might not be big enough.. may need 10000 variance)
For top plot - can improve by increasing number of burnins and number of iterations (nbi and nmc)
For bottom left plot - can improve by adding thinning - after dic statement say thin = (5?)
In paper only report the effects of hard drug use for each of the 4 outcomes (make a table) - but then do an asteric and say that this is results from model controlling for blah blah blah... and potentially include estimates and full model outcome for other covariates in an appendix

10/5:
Second round of running models did nbi=2000 and nmc=100000 and added baseline into crude models.
Overall for all 4 outcomes the crude model hard drug parameter looked good in diagnostics but the intercept and baseine didn't look good. And then for the full models some paramters had really good plots and some really bad. The models for the LEU3N outcome had the best looking plots overall.

Final converging models DICs and betaharddrugs mean estimate (sd), 0 in HPD interval?:
crude = only baseline and hard drugs
full = crude + all additional covariates investigator interested in
red = reduced model = full - hard_drug use (to assess if hard drug use is important predictor)

Final model specifications to get good convergence:
crude models all outcomes: nbi = 1000, nmc = 300000, thin = 20
full & reduced models all outcomes: nbi = 1000, nmc = 350000, thin = 20
all models: sigma2 starting value = 1, prior = inverse gamma(shape = 2.001, scale = 1.001)
all models: betas starting values =0, priors = normal (mean = 0)
            variance = 1000 for aggment, aggphys, and vload
            variance = 100000 for leu3n

AGGMENT
crude: DIC = 3083.337, mean = -1.0041(1.8353), not significant based on HPD
full: DIC = 3091.036, mean = -1.1225(1.9128), not significant based on HPD
red: DIC = 3089.638 (not significant)

AGGPHYS
crude: DIC = 2884.476, mean = -4.2721 (1.4529), significant based on HPD
full: DIC = 2881.642, mean = -3.3322(1.4651), significant based on HPD
red: DIC = 2884.766 (significant)

LOG10VLOAD
crude: DIC = 1287.147, mean = 0.0804(sd = 0.2084), not significant based on HPD
full: DIC = 1284.639, mean = 0.0214(sd = 0.2137), not significant based on HPD
red: DIC = 1282.741 (not significant)

LEU3N
crude: DIC = 5407.689, mean = -194.4 (30.4340), significant based on HPD
full: DIC = 5408.589, mean = -189.2 (31.0734), significant based on HPD
DIC not much different from crude and investigator interested in covariates so will choose the full over the crude)
red: 5443.617 (significant)

Got same conclusions about significance by using DIC and comparing full vs. reduced or by looking at the HPD interval for betaharddrug

