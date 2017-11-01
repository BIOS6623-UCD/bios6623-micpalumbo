/*Project 2 - Descriptive Statistics, Graphs, and Table*/
/*table 1 info just for period 39*/
data proj2b39;
	set proj2b;
	if sixmonth = 39;
run;

/*continuous variables summary*/
proc means data = proj2b39 n nmiss mean stddev;
	var albumin bmi2;
	title1 "Table 1 Continuous Variables";
run;

/*categorical variables summary*/
proc freq data = proj2b39;
	tables death30 proced asa / missing;
	title2 "Table 1 Categorical Variables";
run;


