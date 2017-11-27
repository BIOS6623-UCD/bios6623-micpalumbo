BIOS 6623 Project 3 Notes (from in class and communications with investigators and peers):

November 6, 2017:
Two time periods going on:
1. Know these measures decline slightly as you age
2. Asking if there is some sort of acceleration (comparted to normal aging process) if you're about to be diagnosed with MCI
Big goal = is there a biomarker (one of the 4 outcomes) that can be used to predict diagnosis
Doing different models and analyzing each of the 4 outcomes separately - they are measures for different brain regions so don't expect them to have the same results

November 13, 2017:
Fitting mixed models in R
Using nlme package:
If want model with random effects + correlation structure: use lme() function
If want model with correlation structure only: use gls() function
Can also use lme4 package 

Summary Table: tells about structure of study because design has limited structure
Includes: # of subjects, # of obs on each subject (average w/ sd), average time between measurements (maybe?), how long they are followed for (time btw. first & last obs), average baseline characteristics, average age onset, how long followed before diagnosis (?)

Adding correlation to models is secondary to getting the fixed effects part correct because that is what is going to answer the investigator's questions

Would like to adjust for SES and gender in models 

Group2: Searching data for the point in time where change occurs

November 15, 2017:
The kink (change in slope) is occuring at a different time point for each person
The change point only kicks in for people who have a dementia diagnosis
We will only have linear terms (no quadratic)
Model fixed effects: including effect of case (i.e. have dementia yes/no) allows for different intercepts for those who get diagnosed and those who don't, including effect of interaction case*age allows for a different slope for those who get diagnosed and those who don't
A random intercept allows every subject to have a random intercept
Random intercept with simple R structure accounts for the correlation of repeated measures on the same subject. It is equivalent to a model with no random effects and a CS R structure.
We want to compare slopes between groups before the change point and after the change point.
Within the people with dementia we want to compare the slope before the change point and after the change point to see if it is different. 
Once have fixed effects, could get more detailed with the correlation structure by allowing a different covariance structure for each group... (not sure I will want or know how to do this in R)



November 20, 2017:
Variance for change point estimate-
conditional variance (ladybug theorem), see about what variance calculation they did in the paper (pg. 1562 has variance for beta coefficients)
var(betahat) = average of variances of the betas over each of the change points tested + variance of a list of betas?
pg. 1561 using the profile likelihood is what you use to get confidence interval for mle change point

Table1: is baseline the first time you see them? yes
70 or 71 demented people
Mother dataset- do table 1 before subsetting out people with less than 3 measures
Then tell how many people dropped out due to selection for each outcome dataset
Baseline is the first time they are seen with at least 1 outcome

In write-up, talk about exclusion criteria for determining analytic sample size
Ask investigators what sample I should use for table 1 (do it for analytic sample for each outcome?, do it for entire sample size?)

November 22, 2017:
Only doing animals outcome now!!!
Figure out calculating conditional variance for beta estimates & how to code this 
Figure out calculating 95% CI for the change point & how to code this 