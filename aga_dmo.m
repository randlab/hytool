%% Agarwal et al. solution in the aquifer
% This is a demo of the interpretation of an intereference pumping test 
% with the Agarwal (1970) solution (skin + well capacity).
%
% MIT License
% Copyright (c) 2017 Philippe Renard - University of Neuchâtel (CHYN)

%% Load the data
% The data for this example has been typed from: 
% HALL P., CHEN J., 1996. Water well and aquifer test analysis.
% Water Resources Publications, LLC, 412 pp.
% The test data are published on page 171-174. and interpreted with the 
% Papadopulos-Cooper model with 2 differents storativities.
%
% Let us first load the data.

[t,s]=ldf('pca_ds1.dat');
rw=0.6096;              % Radius of the well in m
rc=0.6096;              % Radius of the casing in m
r=3.048;                % Radial distance in m
Q=0.0050464;            % Pumping rate m3/s
aga_pre(rw,rc,r,Q);

%% Interpretation
% We can then fit the model. It happens that it is not possible to get a
% good automatic fit or manual fit to the data with the Agarwal model. 
% We keep only the manual fit which is based on the late time data
% for the transmissivity. We find:
% T = 8.8 e-4 m2/s, S = 6.7 e-4, sigma=-0.7
p0=aga_gss(t,s);
p=fit('aga',p0,t,s);
p=[1.1,8,-0.7];
aga_rpt(p,t,s,'Hall & Chen example - Automatic fit');

%% 
% For comparison, the results found by Hall and Chen using the 
% Papadopulos-Cooper (1967) model using two different storativities is :
%   alpha = 0.002   which is equivalent to Cd = 1000
%   T    = 7.97e-04 m2/s
%   S1   = 3.49e-03 
%   S2   = 2.00e-03


