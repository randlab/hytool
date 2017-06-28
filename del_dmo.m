%% Fractal solution in 2 dimensions
% This demonstrates the interpretation of pumping test with the
% Delay (2004) solution
%
% Copyright 1998-2007 - Ph. Renard & Co. - GNU GENERAL PUBLIC LICENSE

%%
% The data set for this example comes from the following reference: 
% Problem data provided by Fred Delay (2006)
%
% Let us first load the data and plot them.

[t,s]=ldf('del_ds1.dat');
figure (1)
diagnostic(t,s)

%% 
% We then define the values of the parameters that are required for the
% interpretation:
%
q=0.017916;             % Pumping rate in m3/s
r=70.75;                % Radial distance in m

%%
% Once the data have been loaded and the parameter defined, we can
% interpret the data. We do that as usually in two steps. First the
% parameters p of the model are estimated with the diagnostic plot. Then
% we find an optimum fit.
%
p=fit('del',[0.1,1e2,0.2,0.02],t,s);

%%
% We can then display the result of the interpretation.
% Hytool find that the folowing values fort the transmissivity and
% storativity:
%
% T = 7.5e-2 m2/s and S = 5.7e-4

figure (2)
del_rpt(p,t,s,[0.017916,70.75],'Delay example - automatic fit')
figure(3)
del_rpt([0.044,1.7e1,0.25459,0.025459],t,s,[q,r], 'Delay example - manual fit')

%%
% The results are in reasonable agreement with the values found by 
% Fred Delay (personal communication):
% T0 = 7.97 e-2 m2/s
% S0 = 4.89 e-4
% alpha = 0.2546
% gamma = 0.02546

%%
% We then find that the fits are rather similar and both acceptable.
