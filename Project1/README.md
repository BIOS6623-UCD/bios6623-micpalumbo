Project 1 READ ME:
Descriptions of all files in the Project 1 Folder:

Docs Folder: Includes information about the project, notes from investigators, etc.

Proj1ClassNotes.doc - all notes taken down in meetings with collaborators and investigators

Proj1Description.md- Description of the project provided by the investigator

Proj1WorkingSummary.md - A very rough summary of my work and progress throughout the project to remind me of what I have done in the past and my thought process when doing things

Code Folder: Includes code for all stages of the data analysis

Proj1DataChecking.R - loads the dataset and does some initial data checking for outliers and some initial summary statistics. Cleans data and creates final cleaned dataset to output to SAS

Proj1Descriptives.R - Descriptive statistics, plots, and tables. Looks at each variable of interest on its own, relationship between primary predictor and outcomes, relationship between covariates and outcomes, relationship between primary predictor and covariates, relationship between demographic characteristics and adherence.

Proj1FrequentistModels.R - runs frequentist models to assess that the priors chosen for the Bayesian analysis are indeed uninformative/vague priors. Saw that needed to change variance of prior distribution for the LEU3N outcome.

Proj1Models.sas - includes the Bayesian models run for each outcome using PROC MCMC

Reports Folder: Includes interim and final written reports and presentations. Also includes any important tables or figures. 

Proj1Interim.pptx - Interim presentation slides summarizing inital thoughts from looking into the data and initial plans for analysis

Proj1WrittenReport.rmd - Final written report for Project 1

Proj1WrittenReport.pdf - Pdf file for final written report

ModelOutput Folder - containts pdf files of the full output for the proc mcmc models run for each outcome. For each of the 4 outcomes, 3 models were run: crude(hard drug use and baseline as predictors), full (crude + covariates specified by investigator), reduced (full - hard drug use)

ModelOutputSummary.csv - summary of primary output from models to be imported into R to make a table for the final report

ModelOutputSummary.xls - summary of primary output from models to make table for powerpoint presentation

Proj1Table.csv - Table 1 created in R, outputted to be included in presentation

Proj1Slides.pptx - Final powerpoint presentation slides

