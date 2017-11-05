%% Single fracture in a confined aquifer.
% This demonstrates the interpretation of a pumping test in a confined
% aquifer with infinite conductivity fracture with the Gringarten and 
% Ramey (1974) solution 
%
% MIT License
% Copyright (c) 2017 Philippe Renard - University of Neuchâtel (CHYN)

%%
% The data set for this example comes from the following reference:
% Gringarten A. C., Ramey H. J., & Raghavan R., 1975. 
% Applied Pressure Analysis for Fractured Wells, Petroleum Transactions,
% AIME follows page 784. 
% The test data are published on page 887-889. 
%
% Let us first load the data.

[t,s]=ldf('grg_ds1.dat');
diagnostic(t,s)

%% 
% We then define the values of the parameters that are required for the
% interpretation:
%
% Flow rate : 419 STB/D
% Porosity : 0.12

Q=7.7e-4;            % Pumping rate in m3/s
S=1;                 % Storage coefficient

%%
% Once the data have been loaded and the parameter defined, we can
% interpret the data. We do that as usually in two steps. First the
% parameters p of the model are estimated with the function grg_gss. Then
% we find an optimum fit.
%

p=grg_gss(t,s);
p=fit('grg',p,t,s);

%%
% We can then display the result of the interpretation.
% Hytool find that the folowing values for the transmissivity :
%
% T = 2.1 e-3 m2/s
%

figure (1);
grg_rpt(p,t,s,[Q,S],' Gringarten-Ramey model - automatic fit')

%%
% The results are in reasonable agreement with the values found by 
% Gringarten & Al. (1975):
% Effective permeability (k): 7.11 e-15 m2
% Viscosity (v): 0.65 e-3 Pa.s
% System compressibility (c): 3 e-9 Pa
% Formation volume factor (B): 1.26 RB/STB
% Thickness (e): 25 m
% Porosity : 0.12
% Wellbore radius (rw): 8.25 e-2 m
% Transmissivity [T = ((k*p*g)/v)*e]= 3 e-6 m2/s







