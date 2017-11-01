/*Bootstrap confidence intervals for the expected rate*/

/*take random samples from the data*/
%let numsamp = 1000;

proc surveyselect data = proj2b NOPRINT seed = 16 
	out = outboot
	method = urs
	samprate = 1
	reps = &numsamp;
run; 

/*run logistic model on each of the random samples*/
proc logistic data = outboot NOPRINT;
	by replicate;
	model death30 (event = '1') = proced bmi2 asa;
	output out = predictedboot predicted = pred;
run;

*proc print data = predictedboot (obs = 300);
*run;

data predictedboot39;
	set predictedboot;
	if sixmonth = 39;
run;

/*do a proc univariate to get average predicted value (expected rate) for each hospital 
for each bootstrap sample*/
proc univariate data = predictedboot39 NOPRINT;
	by replicate;
	class hospcode;
	var pred;
	output out = bootmeans mean = exprate;
run;

*proc print data = bootmeans (obs = 100);
*run;

/*then have &numsamp expected rates for each hospital and do another proc univariate to 
look at distribution of expected rates for each hospital (histogram) and get and output
the quantiles - ends of the CI for expected rate for each hospital*/

/*need to sort the bootmeans data by hospcode or say notsorted in by statement*/
proc sort data = bootmeans;
	by hospcode;
run;

proc univariate data = bootmeans NOPRINT;
	by hospcode;
	var exprate;
	histogram;
	output out = bootci pctlpre = cib_ pctlpts = 2.5 97.5 pctlname = lower upper;
run;

proc print data = bootci;
run;

proc export data = bootci dbms = csv
outfile = "/folders/myfolders/bootci.csv"
replace;
run;

	
	







	