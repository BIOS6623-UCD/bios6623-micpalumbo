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
