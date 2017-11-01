/*Project 2 Models*/

/*Full model with procedure type, BMI, ASA, Albumin*/

proc logistic data = proj2b;
	model death30 (event = '1') = proced bmi2 asa albumin;
run;
/*this had to drop 18601 observations because of missing values*/
/*AIC = 2581.943*/

/*Reduced model without albumin*/
proc logistic data = proj2b;
	model death30 (event = '1') = proced bmi2 asa;
	output out = predicted predicted = pred;
run;
/*5172 observations deleted because of missing values*/
/*AIC = 5914.578*/
*proc print data = predicted (obs = 300);
*run;

/*subset to only keep data from period 39*/
data predicted39;
	set predicted;
	if sixmonth = 39;
run;
	
/*expected rates for period 39*/
proc means data = predicted39 mean n;
	class hospcode;
	var pred;
	title "expected rate for each hospital";
	output out = exprate mean = exp;
run;

proc print data = exprate;
run;

proc export data = exprate dbms = csv
outfile = "/folders/myfolders/exprate.csv"
replace;
run;

/*observed rates for period 39*/
proc freq data = predicted39;
	tables death30*hospcode / out = obsrate outpct;
	title "observed rate for each hospital";
run;
/*look at col percent for each hospital (for death30 = 1) that is the percentage mortalilty*/
proc print data = obsrate;
run;

data obsrate2;
	set obsrate;
	if death30 = 0 then delete;
	drop count percent pct_row;
run;

proc print data = obsrate2;
run;

proc export data = obsrate2 dbms = csv
outfile = "/folders/myfolders/obsrate.csv"
replace;
run;





