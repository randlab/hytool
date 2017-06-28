%% Boulton interpretation.  
% This is a demonstration of the interpretation with Boulton (1963) model
% for unconfined aquifer of a pumping test in coastal aquifer 
%
% Copyright 1998-2007 - Philippe Renard & Co. - GNU GENERAL PUBLIC LICENSE

%% Load the data
% The data set for this example has been provided by: 
% G. de Marsily, cours DEA Paris 6, "Aquifère côtier de Nefza, Tunisie".
% Piezometer A3
% 

clear; clf; clc

[t,s]=ldf('blt_ds1.dat');
diagnostic(t,s)

%%  Model parameter identification
%
% We see visually that the fit has been improved. The values of the
% parameters have slightly changed.

p0=blt_gss(t,s);
p=fit('blt',p0,t,s);
trial('blt',p,t,s)

%% Reporting the results

q=0.030; % Pumping rate in m3/s
r=20;       % radial distance in m

blt_rpt(p,t,s,[q,r],'de Marsilly example')
