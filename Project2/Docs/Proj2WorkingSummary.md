Project 2 Working Summary

10/14/17: Loaded the data. (I have the VADATA1 dataset) Not sure at this point if I will carry out my analyses using SAS or R.

Started with trying to use SAS (might need to switch since I have a harder time doing summary stats in SAS compared to R). With inital summary stats of raw data we can see the following: there are 26,520 observations in the dataset. There are no missing values for the hospital code, sixmonth period, or death30 variables. There are 1508 missing values for procedure type, 2160 missing values for asa, 1855 missing values for height weight and bmi, 16498 missing values for albumin. 

Notes about the missingness:
No missing outcome - which is good.
The biggest missingness is from albumin. Ask what albumin is and if this is important to be included in the models or if it can be ignored?

Notes on height, weight, and BMI:
Told that we could just use BMI instead of height and weight. 
For potentially implausible BMI values: 
1. try to recalculate BMI using the formula BMI = weight/(height^2)*703
2. if values are still implausible try to tell if weight is provided in kg instead of lbs, and fix (1kg = 2.2lbs)
3. If it seems to be due to something other than these two reasons write about that

My notes: the minimum weight is 26.7 which seems unreasonable for someone who is receiving heart surgery - ask about the reasonable range of weights. There is also a bimodal distribution for weight - potentially some recorded in kg instead of lbs. The range of bmi was 2 to 75 - ask what is reasonable, pretty sure 2 is impossible. 

Notes on procedure code:
If procedure code = 2 then that is an incorrect value and the individual should be deleted
We see there are some procedure code = 2

After initial review, some things to ask and do going forward:
Albumin- what is it and is it important? is 2.07 min impossible or just a low value?
Reasonable range of weight in pounds?
Reasonable range of BMI?
Consider using proc MI to assess missingness patterns
Look at mean weight and range by hospital code
Create a new BMI variable where use calculation provided to see if BMI was wrong because the calculation was done wrong. Try doing this before and after changing the wrong weights. 
Assess pattern of missingness for missing covariates (might not be too concerning because the outcome is not missing)
Look at trends and descriptives by hospital, by time period, by procedure type, by asa, by missing vs. not missing a covariate, by 30 day mortality

Work on 10/17/17:
Removed the subjects who had incorrect procedure type.
Investigated the problem with the bimodal weight. 
First did descriptives of weight across time period and then across hospital.
When did it across time period I noticed that number of missing weight values were fairly equal across sixmonth periods. Except there was a higher missingness in the last period (period 39). Mean weight is approximately the same across time periods except for last period it is a lot lower. All periods except for the last period have the same range of weights so the error in weight entry is likely in the final sixmonth period. 
When I did the weights across hospital I noticed that hopsitals 1-16 all have a lower mean and unreasonable minimum weights.
Next I decided to look at weight across hopsital for just period 39. I noticed that hospital 30 has no weight data for the 39th period. This explains why period 39 has the highest amount of missing weight data because this period has missing data for an entire hospital. It looks like we can confirm that in period 39 hospitals 1-16 have all incorrectly entered weights (used kg instead of lbs) based on the min and max of weights for these hospital during period 39.

Now I transformed weight for subjects in hospitals 1-16 for period 39 then used the new weight variable to calculate a new BMI variable. Distribution of new weight and bmi look good! Still might be concerned with impossible bmi. The min is 11 (and 5 lowest values are 11 - 14). Are these possible? For BMI cutoffs less than 18.5 is considered underweight and less than 16 is considered severe thinness.

Assessment of missingness:
Variables with missing data: procedure code, BMI/weight/height (will just examine BMI because it is all we will be including in the model), asa, and albumin. 

Procedure Code: missingness of procedure type is even between those who did and did not die after 30 days, missingness of procedure type is fairly even across hospitals and periods, people with asa 4,5, or missing had a slightly higher proportion (3-4%) of missing procedure data compared to people with asa 1,2,3, mean albumin and mean bmi approximatley equal between those missing and not missing procedure type
appears MCAR

BMI: No BMI data at all for hospital 30 in period 39. Higher percentage of missing BMI data as ASA score increases (slight increase - not too concerning), slightly more missing BMI data for those who died after 30 days (but not too crazy of a difference), other than hospital 30 and period 39 BMI missingness is fairly even across hospitals and periods, fairly even BMI missingess across procedure type, mean albumin approximately same between those missing and not missing BMI
excluding that one hospital- appears MCAR

ASA: missingness of ASA fairly similar between those who did and did not die after 30 days, missingness of ASA fairly evene across hospitals and periods, missingness of ASA fairly even across procedure type (slightly higher for procedure = 1), mean albumin and mean BMI approximately the same between those missing vs not missing ASA
appears MCAR

Albumin: more missing albumin data for people who did not die after 30 days (what may be more concering is the difference in 30 day mortality rate between those who did and did not have missing data), missingness of albumin appears fairly even across hospitals and periods, missingness of albumin fairly even across procedure type, missingness of albumin seems to be dependent on ASA (indicating MAR), for ASA 1,2 or 3 there is no albumin data (aka 100% missing), for ASA 4 albumin is ~50% missing, for ASA 5 albumin is 0% missing. Recall ASA 1 indicates good health and ASA 5 indicates near death, so don't have albumin scores for people in the healthier spectrum of the ASA scale
appears MAR

Next steps:
Inform investigators that hospital 30 has no weight data for period 39. - said to talk about it in discussion. 
Consider making plots to further assess patterns of missingness
Answer question: is death rate the same between people who do and do not have missing data? Answer this for each covariate and do it with some sort of measure of significance rather than me just eyeballing the proportions
Descriptive statistics (make table 1 and appropriate graphs)
Begin fitting models - model with and without albumin as covariate)
Bootstrap error estimates
figure out how to output sas dataset as csv to use to create table when I make final report
3 models: 
1 - model with missing albumin data cases removed and albumin included as covariate (done)
2 - model with missing albumin data cases removed (i.e. same sample as 1) and don't include albumin
3 - final model do inference on is model without albumin but does not delete subjects with
Start working on report
create table they want with observed and expected rates and 95% CIs
Discussion: talk about choice to leave out albumin because of 60% missingness and didn't want to waste data - also because MAR might cause bias (either the sick or healthy people left out based on ASA)
Include a percent difference between observed and expected values (helpful for clinical)
Concerned if observed divided by expected > 1.2 (that is what you flag) - i.e. if the differ by 20% or more of what your expected value is then that is clinically concerning
Add this column to the table with observed rate, expected rate, and bootstrap CI of expected rate
Table 1 - give info about VA population as a whole, add some measure of how much the average has variation
mean and std dev (if skewed might want to do 25th median and 75th)
Get dataset with stuff I want to save out of SAS (as SAS dataset or as csv if possible)
Merge datasets based on hospital as common element
http://sphweb.bumc.bu.edu/otlt/mph-modules/bs/sas/sas-basics1/SAS-Basics14.html
https://communities.sas.com/t5/SAS-Analytics-U/How-to-save-sas7bdat-datasets-from-SAS-University-edition/td-p/144778
https://communities.sas.com/t5/SAS-Procedures/save-work-file-in-a-permanent-folder/td-p/46339
https://communities.sas.com/t5/SAS-Procedures/Exporting-a-SAS-data-set-in-SAS-format/td-p/161012
http://support.sas.com/documentation/cdl/en/proc/61895/HTML/default/viewer.htm#a000247723.htm
