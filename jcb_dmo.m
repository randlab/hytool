%% Cooper-Jacob (1946) straight line method
% This is a demonstration of the interpretation of a pumping test
% with the Cooper-Jacob (1946) solution. Note that it is not recommended to
% use the Cooper-Jacob solution as it is only an asymptotic approximation
% of the Theis (1935) solution for late time. The Theis solution should be
% prefered in general.
%
% MIT License
% Copyright (c) 2017 Philippe Renard - University of Neuchâtel (CHYN)

%% Load the data
% The data set for this example has been typed from: 
% Table 5.1, page 172 in the following book:
% C.W. Fetter, 2001, Applied Hydrogeology, Fourth Edition.
% Prentice Hall, Upper Saddle River, 598 pp.
%

%%
% The interpetation is made in three steps: (1)load the data with the ldf
% command, (2) adjust a straight line to the late part of the data set
% (here we take the points from the 3rd to the last), (3) report the
% results.

[t,s]=ldf('ths_ds1.dat');    % load the time and drawdown
p=jcb_gss(t(3:end),s(3:end));   % linear fit of late data (3rd point to last)
q=0.013888;                     % pumping rate in m3/s
r=250;                          % distance to the well in  m
jcb_rpt(p,t,s,[q,r],'Jacob interpretation of the Fetter data') % Report

%%
% We find an estimated transmissivity of 1.5e-3 m2/s and a storativity of
% 1.7e-5, which are identical to the values obtained by Fetter
% (2001) by straight line analysis (p. 174-175). 
%
% Note that the same data are interpreted more precisely with the complete 
% Theis (1941) solution in the ths_dmo example.



