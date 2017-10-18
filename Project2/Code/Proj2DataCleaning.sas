/* Project 2 - Load Data, Data Checking and Cleaning*/

/*load data*/
data proj2;
	set "/folders/myfolders/vadata1";
	if proced > 1 then delete;if proced > 1 then delete;
run;

/*inital data has 26520 observations*/
/*removing the incorrect proced types gives 26518*/

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

/*Initial data cleaning*/


/*Look at weight across time period and across hospital to find where weights were 
likely entered incorrectly as kg instead of lbs*/
 
proc means data = proj2 n nmiss mean stddev min max;
	class sixmonth;
	var weight;
	title "raw data weight across six-month period";
run;

proc means data = proj2 n nmiss mean stddev min max;
	class hospcode;
	var weight;
	title "raw data weight across hospital";
run;

data period39;
	set proj2;
	if sixmonth = 39;
run;

proc means data = period39 n nmiss mean stddev min max;
	class hospcode;
	var weight;
	title "weight across hospital for the last six-month period";
run;

/*create new weight variable (weight2) that converts kg to lbs for the observations
where mistakes were made, create new updated bmi variable using weight2 and height*/
data proj2a;
	set proj2;
	if 1 <= hospcode <= 16 & sixmonth = 39 then 
		if weight = . then weight2 = .;
		else weight2 = weight*2.2;
	else weight2 = weight;
	
	if weight2 = . & height = . then bmi2 = .;
	else bmi2 = (weight2/(height*height))*703;
run;

/*check that weight and height look good now*/
proc univariate data = proj2a;
	var height  weight weight2 bmi bmi2;
	histogram;
	title "checking weight and bmi are fixed";
run;

/*Initial assessments of missing values*/

/*create indicator variables for missing*/
data proj2b;
	set proj2a;
	if bmi2 = . then bmi2_missing = 1;
		else bmi2_missing = 0;
	if proced = . then proced_missing = 1;
		else proced_missing = 0;
	if asa = . then asa_missing = 1;
		else asa_missing = 0;
	if albumin = . then albumin_missing = 1;
		else albumin_missing = 0;
run;

/*missingness of bmi2*/
/*for tables, compare the colpercent for missing and not across columns*/
proc freq data = proj2b;
	tables bmi2_missing*death30 bmi2_missing*hospcode bmi2_missing*sixmonth
	bmi2_missing*proced bmi2_missing*asa / missing;
	title "Missingness of BMI";
run;

proc means data = proj2b missing n nmiss mean stddev;
	class bmi2_missing;
	var albumin;
	title "Missingness of BMI";
run;

/*missingness of proced*/
proc freq data = proj2b;
	tables proced_missing*death30 proced_missing*hospcode proced_missing*sixmonth
	proced_missing*asa / missing;
	title "Missingness of Procedure Type";
run;

proc means data = proj2b missing n nmiss mean stddev;
	class proced_missing;
	var albumin bmi2;
	title "Missingness of Procedure Type";
run;

/*missingness of asa*/
proc freq data = proj2b;
	tables asa_missing*death30 asa_missing*hospcode asa_missing*sixmonth
	asa_missing*proced / missing;
	title "Missingness of ASA";
run;

proc means data = proj2b missing n nmiss mean stddev;
	class asa_missing;
	var albumin bmi2;
	title "Missingness of ASA";
run;

/*missingness of albumin*/
proc freq data = proj2b;
	tables albumin_missing*death30 albumin_missing*hospcode albumin_missing*sixmonth
	albumin_missing*proced albumin_missing*asa / missing;
	title "Missingness of Albumin";
run;

proc means data = proj2b missing n nmiss mean stddev;
	class albumin_missing;
	var bmi2;
	title "Missingness of Albumin";
run;

/*tried a proc mi but couldn't get it to work as I wanted*/
proc mi data = proj2a;
	class death30;
	var bmi2 proced asa albumin death30;
	fcs;
	ods select misspattern;
run;





