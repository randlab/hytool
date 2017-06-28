%% Pumping test in a double porosity aquifer
% This demonstrates the interpretation of a pumping test with the
% Warren and Root (1965) solution
%
% Copyright 1998-2007 - Ph. Renard & Co. - GNU GENERAL PUBLIC LICENSE

%%
% The data set for this example comes from the following reference: 
% Moench, A. 1984. Double porosity model for a fissured groundwater 
% reservoir with fracture skin. Water Resources Research, 20(7), 831-846.
% Table 2, Page 838.

%% General Information:
% Fissured tertiary volcanic rocks in the vicinity of the Yucca Mountain
% at Nevada Test Site. One pumped well UE-25b#1 and one observation
% well UE-25a#1. Pumping duration was about three days.
%
% Let us first load the data and plot the diagnostic.

clear
[t,s]=ldf('war_ds1.dat');
diagnostic(t,s)

%% 
% We then define the values of the field parameters that are required 
% for the interpretation:

e=400;                   % Estimated reservoir thickness in m
rw=0.11;                 % Radius of well in m
rc=0.11;                 % Radius of casing in m
Q=3.58e-2;               % Flow rate m3/s
 
%%
% Once the data have been loaded and the parameter defined, we can
% interpret the data. We do that as usually in two steps. First the
% parameters p of the model are estimated with the function war_gss. Then
% we find an optimum fit.
%

p=war_gss(t,s);
p=fit('war',p,t,s);
trial('war',p,t,s) 

%%
% We can then display the result of the interpretation.
% Hytool find that the folowing values fort the transmissivity :
%
% Pumping well :T = 2.1 e-3 m2/s
%

war_rpt(p,t,s,[Q,rw],'Diagnostic plot')

%%
% The results are in reasonable agreement with the values found by 
% Moench (1984):
%  T = 3.3 E-3 m2/s

%%
% We then find that the fits are rather similar and both acceptable. 




