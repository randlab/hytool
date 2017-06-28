%% Confined aquifer with leakage
% This demonstrates the interpretation of a pumping test in confined 
% aquifer with leakage with the% hantush and Jacob (1955) model
%
% Copyright 1998-2007 - Ph. Renard & Co. - GNU GENERAL PUBLIC LICENSE

%%
% The data set for this example comes from the following reference: 
% Hall, P. Water well and aquifer test analysis 1996, Water Resources
% Publications, LLC, 412 pp. Example  Fig 11.14 p.267-268
%
% Let us first load the data and plot them.

[t,s]=ldf('htj_ds1.dat');
diagnostic(t,s)

%% 
% We then define the values of the parameters that are required for the
% interpretation:
%
%   t = measured time
%   s = measured drawdown
%   d(1) = Q =6.309 e-3 m3/s    % Pumping rate
%   d(2) = r =3.048 m           % Distance to the pumping well
%   d(3) = e'=6.096 m           % Thickness of the aquitard

%%
% Once the data have been loaded and the parameter defined, we can
% interpret the data. We do that as usually in two steps. First the
% parameters p of the model are estimated with the function htj_gss. Then
% we used to find an optimum fit.
%

p0=htj_gss(t,s);  % The initial guess is incorrect
trial('htj',p0,t,s) 
p=fit('htj',p0,t,s);

%%
% We can then display the result of the interpretation.
% Hytool find that the folowing values for the transmissivity and
% storativity:
%
% T: 1.4e-004 m2/s and S: 1 e-04
%

htj_rpt(p,t,s,[6.309e-3,3.048,6.096],'Hall example - automatic fit')

%%
% The results are in reasonable agreement with the values found by Hall
% (1996):
% T = 7.77 e-5 m2/s
% S = 5.0193 e-4

%%
% We then find that the fits are rather similar and both acceptable.

