/*Bootstrap confidence intervals for the expected rate*/

/*take random samples fromt the data*/
%let numsamp = 100;

proc surveyselect data = proj2b NOPRINT seed = 16 
	out = outboot
	method = urs
	samprate = 1
	reps = &numsamp;
run; 

/*run logistic model on each of the random samples*/
proc logistic data = outboot;
	by replicate;
	model death30 (event = '1') = proced bmi2 asa;
	output out = predictedall predicted = pred;
run;





	