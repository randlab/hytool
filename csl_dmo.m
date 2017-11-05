%% Interpretation of a slug test
% This demonstrates the interpretation of a slug test with the
% Cooper et al. (1967) solution
%
% MIT License
% Copyright (c) 2017 Philippe Renard - University of Neuchâtel (CHYN)

%% Load the data
% The data set for this example comes from: 
% Butler James, 1998, The design, performance and analysis of slug tests.
% Lewis Publisher. Data set from table 5.2 pp. 61-62.
% Localisation: Test performed in a monitoring well in Lincoln County, Kansas
% Geology : The well was screened in a deltaic sequence consisting of mudstone interbedded with very fine sandstone
%
% Let us first load the data

[t,s]=ldf('csl_ds1.dat');

%% Interpretation
% Once the data have been loaded and the parameter defined, we can
% interpret the data. As usual, we can use the guess function to 
% obtain a first estimates of the parameter and check the quality of
% the first guess with the trial function.
%
% Note that the trial function can be used to adjust manually the
% parameters if required.

p=csl_gss(t,s); 
trial('csl',p,t,s)

%% 
% We then apply the non linear fit and create the report.
% We find  the folowing values for the transmissivity:
%
% T = 1.3 e-8 m2/s 
% Cd = 45 for the wellbore storage coefficient
%

p=fit('csl',p,t,s);
rw=0.071;               % Radius of the well in m
rc=0.025;               % Radius of the casing in m
csl_pre(rw,rc);
csl_rpt(p,t,s,'Butler example - automatic fit')

%%
% The results compares well with the values found by 
% Cooper et al. (1967) with type-curve matching:
% alpha = 0.0125 corresponding to a value of Cd=40
% T  = 1.23 e-8 m2/s 
%
