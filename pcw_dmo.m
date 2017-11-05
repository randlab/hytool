%% Drawdown in the well.
% This demonstrates the interpretation of a Drawdown in the well 
% with well-bore storage effect with Papadopulos and Cooper (1967) solution 
%
% MIT License
% Copyright (c) 2017 Philippe Renard - University of Neuchâtel (CHYN)

%%
% The data set for this example comes from the following reference:
% Rushton K.R. and Holt S.M., 1981, Estimating aquifer parameters for 
% large-diameter well. Ground Water, 19(5): 505-509
% Digitized from figure 3b page 508.
% The test is conducted in a well in a confined aquifer in south India.
%
% Let us first load the data and plot them.

[t,s]=ldf('pcw_ds1.dat');
diagnostic(t,s);

%% 
% We then define the values of the parameters that are required for the
% interpretation:

Q=0.007997685185185;        % Pumping rate in m3/s
rw=0.1078;                  % Radius of well screen in m
rc=2.4;                     % Radius of the casing in m

%%
% Once the data have been loaded and the parameter defined, we can
% interpret the data. We do that as usually in two steps. First we can 
% estimate the parameter p with the function pcw_gss. 
% Then we find an optimum fit.
%

p0= pcw_gss(t,s);
trial('pcw',p0,t,s);
p1=fit('pcw',p0,t,s);

%%
% We can then display the result of the interpretation.
% Hytool find that the folowing values fort the transmissivity :
%
% T = 5.5 e-4 m2/s
%

pcw_rpt(p1,t,s,[Q,rw,rc],'Rushton example - automatic fit')

%%
% The results are in reasonable agreement with the values found by
% Rushton K.R. and Holt S.M. :
% T = 2.77 e-4 to 3.36 e-4 m2/s
                 
%%
% We then find that the fits are rather similar and both acceptable. 
