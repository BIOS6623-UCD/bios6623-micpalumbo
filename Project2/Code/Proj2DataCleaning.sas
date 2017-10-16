/* Project 2 - Load Data, Data Checking and Cleaning*/

/*load data*/
data proj2;
	set "/folders/myfolders/vadata1";
run;

/*summary statistics & initial data checking*/
proc means data = proj2 n nmiss mean stddev min max;
	title1 "Summary of Raw Data for All Variables";
run;

proc freq data = proj2;
	tables hospcode sixmonth;
run;
/*pretty equal amounts of subjects across hospitals*/
/*pretty similar amounts of subjects across periods*/

proc freq data = proj2;
	tables death30;
run;

proc freq data = proj2;
	tables proced /missprint;
run;
/*note that there are 2 subjects coded as proced =2 that will need to remove*/

proc freq data = proj2;
	tables asa /missprint;
run;
/*excluding missing data, most subjects in 2-4 range*/

/*histograms of bmi, weight, and height to see how many seem to be in unreasonable value*/
proc univariate data = proj2;
	var height weight bmi;
	histogram;
run;
/*distribution of height looks beautifully normal*/
/*see that weight has bimodal distribution - smaller peak at lower unreasonable pound values
of weight - possibly a single hospital or two did weight as kg instead of pounds,
investigate further with calculation of mean by hospital code, if don't see anything there
calculate the mean weight by sixmonth period*/






