Project 0 README

The general outline of folders: 1) SAS and R analysis and data management files can be 
found in the Code folder; 2) Reports contain the graphs and figures from my code and the
reports that were created along the way; 3) Docs contains graphs and figures at times and
other things like investigator questions or docs the investigator sent me.

Description of files:

Code folder:
Proj0descriptives.R:
This file imports the data and contains some code for data checking and for descriptive statistics. 
Upon initial examination it appears that 27 subjects were lost to followup and didn't show up for measurements at the 1 year mark because there are 27 NAs for both attach1year and pd1year.

Proj0graphs.R:
Includes initial graphics - plots, crosstabs examining the variables and their relationships

Proj0modelspd.R:
Fitting different models for pocket depth
Models included: Only diffpd and treatment group, using baseline as covariate, inclusion of other covariates.
Looked at AICs and residual plots of models to determine which model best fits the data

Proj0modelsat.R:
Fitting different models for attachment
Models included: Only diffat and treatment group, using baseline as covariate, inclusion or exclusion of other covariates.
Looked at AICs and residual plots of models to determine which model best fits the data

Proj0modelsfinal.R:
Includes the final model I chose based on AIC and residual plots for each outcome (change in attachment and change in pocket depth). 
Includes summary of models to get paramter estimates and results

Docs Folder:
Project 0 Overview.docx:
Includes notes about the project that I took in class while talking with the investigator

Proj0Description.txt:
Describes the overview of the project, variables, data, and how it was collected. Also has the primary question of interest.

Reports Folder:
Proj0WrittenReport.Rmd/Proj0WrittenReport.pdf:
This is my final write up and report for the project. I wrote it in an Rmd file that I knitted to a pdf.

Proj0Slides.pptx
These are the powerpoint slides for my final presentation for this project

Proj0dropout.png
Image of graph of dropout trends to put in slides

Proj0dropoutcolors.png
Image of graph of dropout trends to put in slides with colorful bars

Proj0Tab1.csv
Saving the Table1 contents as a dataset xcel file

