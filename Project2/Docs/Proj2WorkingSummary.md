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

Next steps:
First cleaning - remove proced 2, and fix weight and bmi
Then assess missingness and potentially clean more