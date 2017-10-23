Project 2 Class Discussion Notes

10/11/17
Death rates - give a lot 
Want observed estimate just for the most recent 6 months
Use all of previous data just to come up with an expected estimate to compare to the observed estimate
Use BMI instead of height and weight
Check to see if certain crazy values are coming from a particular hospital
BMI potential data entry errors?

In a report want table with the following columns: hospital, observed # died, observed # seen, observed mortality rate, expected mortality rate (all of these for each hospital)
Pool all data across all hospitals (and years) to do this - they are all general VA patient populations
There should not be time trends
Not Bayesian
Procedure 2 is another non-cardiac procedure so don't want to include people with that
Can report rate as # people who died per 1000 or as a percentage

10/16/17
This is a logistic regression, we want to get an expected rate
Random effect for hospital
Investigate missing data further - create indicator variable for missing or observed and look at death rates between missing vs. observed
Before re-calculating BMI plot it across time period and plot it across hospital
You can get a hospital level effect without putting hospital in the model (what we should do.. not sure how?)
We should not be doing a correlated data model - just do a plain logistic model
Logistic model - get odds ratio
Logistic model: p_i = probability of a 1 for subject i
logit(p_i/1 - p_i) = X_i*Beta
We can also get p_i hat estimates by back transforming
Potentially calculate p_i hat for each person and then average peoples estimate grouped by what hospital they were in 
So would you also not put time period in the model? No

10/23/17:
Sample from all the data and repeat whole modelling process each time (not sampling from predicted values)
Notes from Project 1 and take home points:
Keep pushing and making progress because it is 25% of your grade. 
Data management is important. 
Detail in the methods section - need enough about statistical methods that they could reproduce the results. 


