%% Dradown in the aquifer - two storativities.
% This demonstrates the interpretation of a Drawdown in the aquifer 
% with well-bore storage effect with Papadopulos and Cooper (1967) solution
%
% Copyright 1998-2007 - Ph. Renard & Co. - GNU GENERAL PUBLIC LICENSE

%%
% The data set for this example comes from the following reference: 
% HALL P., CHEN J., 1996. Water well and aquifer test analysis.
% Water Resources Publications, LLC, 412 pp.
% The test data are published on page 171-174. and interpreted with the
% Papadopulos-Cooper model with 2 differents storativities.
%
% Let us first load the data set and initialize the pdb function.

[t,s]=ldf('pca_ds1.dat');
rw=0.6096;              % Radius of the well in m
rc=0.6096;              % Radius of the casing in m
r=3.048;                % Radial distance in m
q=0.0050472;            % Pumping Rate in m3/s
pcb_pre(rw,rc,r,q);

%% Interpretation
% The interpretation follows the usual techniques in hytool with the
% guess of the parameters, non linear fit, and reporting.
% 
% We obtain a good fit in that case (if we compare with pda_dmo and
% aga_dmo). The values of resulting parameters are:
% T = 8.3 e-4 m2/s, S = 2.2 e-3, and Cd = 73
%
p0=pcb_gss(t,s); 
p=fit('pcb',p0,t,s);
pcb_rpt(p,t,s,'Hall and Chen (1996) example');

%% Comparison with Hall and Chen (1996)
% Our results are in good agreement with the values found by
% Hall and Chen (1996) - figure 9.8 page 174 :
%   alpha = 0.01   which is equivalent to Cd = 50
%   T    = 7.8E-04
%   S1   = 2.9E-03
%   S2   = 1.0E-02





