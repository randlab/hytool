%% Theis solution with a constant head boundary for Multiple rate tests 
% This demonstrates the interpretation of the drawdown at time t for
% multiple rate tests with accounting for a constant head boundary
% with the Theis (1935) solution
%
% Copyright 1998-2007 - Ph. Renard & Co. - GNU GENERAL PUBLIC LICENSE

%%
% The data set for this example is synthetic. It has been created with 
% by using the function tmr_dim plus a random noise, and saved in a file.
% s = tmc_dim([1e2,20,300],t)+rand(80,1)*0.02-0.01;
%
% Let us first load the data and plot them.

[t,s]=ldf('tmc_ds1.dat');


%% 
% We then define the values of the parameters that are required for the
% interpretation:
%
% The piezometer is located at 20m from the pumping well.
% Three rate tests [t(min);q(m3/d)]:[30,500;80,100;130,800];

q=[30*60,500/24/60/60;80*60,100/24/60/60;130*60,800/24/60/60];
tmc_pre(q);

%%
% Once the data have been loaded and the parameter defined, we can
% interpret the data. We do that as usually in two steps. First the
% parameters p of the model are estimated with the function tmc_gss. Then
% we an optimum fit.
%

p=tmc_gss(t,s);
p=fit('tmc',p,t,s);

%%
% We can then display the result of the interpretation.
% Hytool find that the folowing values fort the transmissivity and
% storativity:
%
% T = 1.9 e-3 m2/s and S = 2.0 e-4
%

tmc_rpt(p,t,s,20,'automatic fit')

%%
% The results are in reasonable agreement with the values found by this
% reference :
% T = 1.8 e-3 m2/s
% S = 2.1 e-4
% ri = 77 m

%%
% We then find that the fits are rather similar and both acceptable. 





