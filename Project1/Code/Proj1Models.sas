/*Project 1 Models*/

/*import cleaned data from R*/
proc import datafile = "/folders/myfolders/Proj1SASDataClean.csv"
	OUT = Proj1
	DBMS = csv
	REPLACE;
	GETNAMES = YES;
run;

proc print data = Proj1;
run;

/*first attempt at proc mcmc models - want to look at plots for convergence and see
if we need to change things like nbi, nmc, etc. so we see convergence and nice plots*/
/*attempt 1: nbi = 1000, nmc = 10000*/
/*second attempt - add baseline to crude models, nbi=2000, nmc = 100000*/
/*third attempt: nbi = 2500, nmc = 200000*/
/*4th attempt: nbi = 1000, nmc = 300000, thin = 20*/

/*agg_ment models*/
/*agg_ment crude model*/
proc mcmc data = Proj1 nbi = 1000 nmc = 300000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betaharddrug 0;
	parms betabase 0;
	parms sigma2 1;
	prior betaint betaharddrug betabase ~ normal(mean = 0, var = 1000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betaharddrug*hard_drugs_0 + betabase*AGG_MENT_0;
	model AGGMENTdiff ~ normal(mu, var = sigma2);
	title "AGGMENTdiff crude model3";
run; title; 
/*attempt 1: DIC = 3256.513*/
/*crudefinalpdf: nbi=1000, nmc=300000, thin=20, this is what I will use finally!*/

/*agg_ment full model*/
proc mcmc data = Proj1 nbi = 1000 nmc = 350000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betaharddrug 0;
	parms betabase 0;
	parms betahash 0;
	parms betabmi 0;
	parms betasmoke 0;
	parms betadrink 0;
	parms betarace 0;
	parms betaeduc 0;
	parms betaage 0;
	parms betaadh 0;
	parms betaincomemid 0 betaincomehigh 0;
	parms sigma2 1;
	prior betaint betaharddrug betabase betahash betabmi betasmoke betadrink betarace
	betaeduc betaage betaadh betaincomemid betaincomehigh ~ normal(mean = 0, var = 1000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betaharddrug*hard_drugs_0 + betabase*AGG_MENT_0 + betahash*HASHV_0 +
	betabmi*BMI_0 + betasmoke*SMOKE_0 + betadrink*DKGRP_0 + betarace*RACE_0 +
	betaeduc*EDUCBAS_0 + betaage*age_0 + betaadh*ADH_2 + betaincomemid*income_0mid +
	betaincomehigh*income_0high;
	model AGGMENTdiff ~ normal(mu, var = sigma2);
	title "AGGMENTdiff full model3";
run; title;
/*attempt 1: DIC = 3097.113, diagnostics all looking pretty rough*/
/*full final: nbi = 1000, nmc = 300000, thin = 20*/
/*full final2: nbi = 1000, nmc = 350000, thin = 20, this is what I will use finally!*/

/*agg_ment reduced model*/
proc mcmc data = Proj1 nbi = 1000 nmc = 350000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betabase 0;
	parms betahash 0;
	parms betabmi 0;
	parms betasmoke 0;
	parms betadrink 0;
	parms betarace 0;
	parms betaeduc 0;
	parms betaage 0;
	parms betaadh 0;
	parms betaincomemid 0 betaincomehigh 0;
	parms sigma2 1;
	prior betaint betabase betahash betabmi betasmoke betadrink betarace
	betaeduc betaage betaadh betaincomemid betaincomehigh ~ normal(mean = 0, var = 1000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betabase*AGG_MENT_0 + betahash*HASHV_0 +
	betabmi*BMI_0 + betasmoke*SMOKE_0 + betadrink*DKGRP_0 + betarace*RACE_0 +
	betaeduc*EDUCBAS_0 + betaage*age_0 + betaadh*ADH_2 + betaincomemid*income_0mid +
	betaincomehigh*income_0high;
	model AGGMENTdiff ~ normal(mu, var = sigma2);
	title "AGGMENTdiff reduced model3";
run; title;


/*agg_phys models*/
/*agg_phys crude model*/
proc mcmc data = Proj1 nbi = 1000 nmc = 300000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betaharddrug 0;
	parms betabase 0;
	parms sigma2 1;
	prior betaint betaharddrug betabase ~ normal(mean = 0, var = 1000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betaharddrug*hard_drugs_0 + betabase*AGG_PHYS_0;
	model AGGPHYSdiff ~ normal(mu, var = sigma2);
	title "AGGPHYSdiff crude model3";
run; title; 
/*attempt 1: DIC = 2923.308*/
/*crude1: nbi = 1000, nmc = 300000, thin=20, this is what I will use finally!*/


/*agg_phys full model*/
proc mcmc data = Proj1 nbi = 1000 nmc = 350000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betaharddrug 0;
	parms betabase 0;
	parms betahash 0;
	parms betabmi 0;
	parms betasmoke 0;
	parms betadrink 0;
	parms betarace 0;
	parms betaeduc 0;
	parms betaage 0;
	parms betaadh 0;
	parms betaincomemid 0 betaincomehigh 0;
	parms sigma2 1;
	prior betaint betaharddrug betabase betahash betabmi betasmoke betadrink betarace
	betaeduc betaage betaadh betaincomemid betaincomehigh ~ normal(mean = 0, var = 1000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betaharddrug*hard_drugs_0 + betabase*AGG_PHYS_0 + betahash*HASHV_0 +
	betabmi*BMI_0 + betasmoke*SMOKE_0 + betadrink*DKGRP_0 + betarace*RACE_0 +
	betaeduc*EDUCBAS_0 + betaage*age_0 + betaadh*ADH_2 + betaincomemid*income_0mid +
	betaincomehigh*income_0high;
	model AGGPHYSdiff ~ normal(mu, var = sigma2);
	title "AGGPHYSdiff full model3";
run; title;
/*attempt 1: DIC = 2887.376, diagnostics look terrible*/
/*full final1: nbi = 1000, nmc = 300000, thin = 20*/
/*full final2: nbi = 1000, nmc = 350000, thin = 20, this is what I will use finally!*/

/*aggphys reduced model*/
proc mcmc data = Proj1 nbi = 1000 nmc = 350000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betabase 0;
	parms betahash 0;
	parms betabmi 0;
	parms betasmoke 0;
	parms betadrink 0;
	parms betarace 0;
	parms betaeduc 0;
	parms betaage 0;
	parms betaadh 0;
	parms betaincomemid 0 betaincomehigh 0;
	parms sigma2 1;
	prior betaint betabase betahash betabmi betasmoke betadrink betarace
	betaeduc betaage betaadh betaincomemid betaincomehigh ~ normal(mean = 0, var = 1000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betabase*AGG_PHYS_0 + betahash*HASHV_0 +
	betabmi*BMI_0 + betasmoke*SMOKE_0 + betadrink*DKGRP_0 + betarace*RACE_0 +
	betaeduc*EDUCBAS_0 + betaage*age_0 + betaadh*ADH_2 + betaincomemid*income_0mid +
	betaincomehigh*income_0high;
	model AGGPHYSdiff ~ normal(mu, var = sigma2);
	title "AGGPHYSdiff reduced model3";
run; title;

/*log10vload models*/
/*log10vload crude model*/
proc mcmc data = Proj1 nbi = 1000 nmc = 300000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betaharddrug 0;
	parms betabase 0;
	parms sigma2 1;
	prior betaint betaharddrug betabase ~ normal(mean = 0, var = 1000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betaharddrug*hard_drugs_0 + betabase*log10vload_0;
	model log10vloaddiff ~ normal(mu, var = sigma2);
	title "log10vloaddiff crude model3";
run; title; 
/*attempt 1: DIC = 1345.520*/
/*crudefinal1: nbi = 1000, nmc = 300000, thin =20, this is what I will use finally!*/

/*log10vload full model*/
proc mcmc data = Proj1 nbi = 1000 nmc = 350000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betaharddrug 0;
	parms betabase 0;
	parms betahash 0;
	parms betabmi 0;
	parms betasmoke 0;
	parms betadrink 0;
	parms betarace 0;
	parms betaeduc 0;
	parms betaage 0;
	parms betaadh 0;
	parms betaincomemid 0 betaincomehigh 0;
	parms sigma2 1;
	prior betaint betaharddrug betabase betahash betabmi betasmoke betadrink betarace
	betaeduc betaage betaadh betaincomemid betaincomehigh ~ normal(mean = 0, var = 1000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betaharddrug*hard_drugs_0 + betabase*log10vload_0 + betahash*HASHV_0 +
	betabmi*BMI_0 + betasmoke*SMOKE_0 + betadrink*DKGRP_0 + betarace*RACE_0 +
	betaeduc*EDUCBAS_0 + betaage*age_0 + betaadh*ADH_2 + betaincomemid*income_0mid +
	betaincomehigh*income_0high;
	model log10vloaddiff ~ normal(mu, var = sigma2);
	title "log10vloaddiff full model3";
run; title;
/*attempt 1 DIC = 1286.211, diagnostics look terrible*/
/*fullfinal1: nbi = 1000, nmc = 300000, thin=20*/
/*fullfinal2: nbi = 1000, nmc = 350000, thin = 20, this is what I will use finally!*/

/*log10vload reduced*/
proc mcmc data = Proj1 nbi = 1000 nmc = 350000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betabase 0;
	parms betahash 0;
	parms betabmi 0;
	parms betasmoke 0;
	parms betadrink 0;
	parms betarace 0;
	parms betaeduc 0;
	parms betaage 0;
	parms betaadh 0;
	parms betaincomemid 0 betaincomehigh 0;
	parms sigma2 1;
	prior betaint betabase betahash betabmi betasmoke betadrink betarace
	betaeduc betaage betaadh betaincomemid betaincomehigh ~ normal(mean = 0, var = 1000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betabase*log10vload_0 + betahash*HASHV_0 +
	betabmi*BMI_0 + betasmoke*SMOKE_0 + betadrink*DKGRP_0 + betarace*RACE_0 +
	betaeduc*EDUCBAS_0 + betaage*age_0 + betaadh*ADH_2 + betaincomemid*income_0mid +
	betaincomehigh*income_0high;
	model log10vloaddiff ~ normal(mu, var = sigma2);
	title "log10vloaddiff reduced model3";
run; title;

/*leu3n models*/
/*used prior distribution of mean =0 and var = 100000 for this outcome*/
/*leu3n crude model*/
proc mcmc data = Proj1 nbi = 1000 nmc = 300000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betaharddrug 0;
	parms betabase 0;
	parms sigma2 1;
	prior betaint betaharddrug betabase ~ normal(mean = 0, var = 100000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betaharddrug*hard_drugs_0 + betabase*LEU3N_0;
	model LEU3Ndiff ~ normal(mu, var = sigma2);
	title "LEU3Ndiff crude model3";
run; title; 
/*attempt 1: DIC = 5471.972*/
/*crude final: nbi=1000, nmc=300000, thin=20, this is what I will use finally!*/

/*leu3n full model*/
proc mcmc data = Proj1 nbi = 1000 nmc = 350000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betaharddrug 0;
	parms betabase 0;
	parms betahash 0;
	parms betabmi 0;
	parms betasmoke 0;
	parms betadrink 0;
	parms betarace 0;
	parms betaeduc 0;
	parms betaage 0;
	parms betaadh 0;
	parms betaincomemid 0 betaincomehigh 0;
	parms sigma2 1;
	prior betaint betaharddrug betabase betahash betabmi betasmoke betadrink betarace
	betaeduc betaage betaadh betaincomemid betaincomehigh ~ normal(mean = 0, var = 100000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betaharddrug*hard_drugs_0 + betabase*LEU3N_0 + betahash*HASHV_0 +
	betabmi*BMI_0 + betasmoke*SMOKE_0 + betadrink*DKGRP_0 + betarace*RACE_0 +
	betaeduc*EDUCBAS_0 + betaage*age_0 + betaadh*ADH_2 + betaincomemid*income_0mid +
	betaincomehigh*income_0high;
	model LEU3Ndiff ~ normal(mu, var = sigma2);
	title "LEU3Ndiff full model3";
run; title;
/*atttempt 1: DIC = 5465.308 diagnostics look terrible*/
/*fullfinal1: nbi = 1000, nmc = 300000, thin = 20*/
/*fullfinal2: nbi = 1000, nmc = 350000, thin = 20* this is what I will use finally!/

/*leu3n reduced*/
proc mcmc data = Proj1 nbi = 1000 nmc = 350000 plots = all dic thin = 20 seed = 15;
	parms betaint 0;
	parms betabase 0;
	parms betahash 0;
	parms betabmi 0;
	parms betasmoke 0;
	parms betadrink 0;
	parms betarace 0;
	parms betaeduc 0;
	parms betaage 0;
	parms betaadh 0;
	parms betaincomemid 0 betaincomehigh 0;
	parms sigma2 1;
	prior betaint betabase betahash betabmi betasmoke betadrink betarace
	betaeduc betaage betaadh betaincomemid betaincomehigh ~ normal(mean = 0, var = 100000);
	prior sigma2 ~ igamma(shape = 2.001, scale = 1.001);
	mu = betaint + betabase*LEU3N_0 + betahash*HASHV_0 +
	betabmi*BMI_0 + betasmoke*SMOKE_0 + betadrink*DKGRP_0 + betarace*RACE_0 +
	betaeduc*EDUCBAS_0 + betaage*age_0 + betaadh*ADH_2 + betaincomemid*income_0mid +
	betaincomehigh*income_0high;
	model LEU3Ndiff ~ normal(mu, var = sigma2);
	title "LEU3Ndiff reduced model3";
run; title;


