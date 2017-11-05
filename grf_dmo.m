%% General Radial Flow model interpretation
% This is a demonstration of the interpretation of a pumping test with the
% Barker (1988) solution.
%
% MIT License
% Copyright (c) 2017 Philippe Renard - University of Neuchâtel (CHYN)

%%
% The data set for this example comes from the following reference: 
% G. Lods and P. Gouze (2004) WTFM, software for well test analysis in 
% fractured media combining fractional flow with double porosity 
% approaches. Computers and Geosciences. Vol 30. pp. 937-947
% Example CS2 and CS3, page 943-944

%% 
% This demo is composed by two example:
% grf_ds1.dat : time in s,  drawdown in m in the well Sha1B
% grf_ds2.dat : time in s,  drawdown in m in the well Sha1BT


%% FIRST EXAMPLE
%
% Let us first load the data and plot them.

clear; clf; clc
[t,s]=ldf('grf_ds1.dat');
diagnostic(t,s)

%% 
% We then define the values of the parameters that are required for the
% interpretation:
%
% r   = 26.2 m
% rw  = rc = 0.1 m
% Q   = 0.02322 m3/s


%% 
% We prepare the model and fit it to the data. A manual trial is required.

grf_pre(26.2,0.1);
p=grf_gss(t,s);  
%p=[0.002,0.00006,1];
trial('grf',p,t,s)

%%
% We can then display the result of the interpretation.
% Hytool find that the folowing values fort the transmissivity and
% storativity:
%
% Equivalent transmissivity: 2.3 e-3m2/s
% Equivalent storativity: 4.4 e-2m2/s

p=fit('grf',p,t,s);
grf_rpt(p,t,s,[0.021],'well Sha1B - automatic fit')
figure (3)

%%
% The results are in reasonable agreement with the values found by 
% Hamm and Bideaux Model(1994):
%
% skin factor = 6230
% flow dimension n = 0.7
% Equivalent Cylindrical Transmissivity = 108 m2/s
% Equivalent Cylindrical Storativity = 9.17 e-2
% K e^(3-n) = 29.0 m^(4-n) s^(-1)
% Ss e^(3-n) =2.46 e-2 m^(2-n)
% lambda = 4.8e-5
% omega = 2.59 e-4
% sigma fracture = 5


%% SECOND EXAMPLE
%
% Let us first load the data and plot them.

[t,s]=ldf('grf_ds2.dat');
diagnostic(t,s)

%% 
% We then define the values of the parameters that are required for the
% interpretation:
%
% Estimated reservoir thickness e = 40m
% r = 26.2 m
% rw  = rc = 0.1 m
% Q  = 83.6 m3/h = 0.02322 m3/s

%% 
% We prepare the model and fit it to the data. A manual trial is required.

grf_pre(26.2,0.1);
p=grf_gss(t,s);
trial('grf',p,t,s) 

%%
% We can then display the result of the interpretation.
% Hytool find that the folowing values fort the transmissivity and
% storativity:
%
% Equivalent transmissivity: 1.2e-1 m2/s
% Equivalent storativity: 5.7e-5


p=fit('grf',p,t,s);
figure (4)
grf_rpt(p,t,s,[0.021],'well Sha1BT - automatic fit')


%%
% The results are in reasonable agreement with the values found by 
% Hamm and Bideaux Model(1994):
%
% skin factor = 6230
% flow dimension n = 0.7
% K e^(3-n) = 29.0 m^(4-n) s^(-1)
% Equivalent Cylindrical Transmissivity = 108 m2s-1
% Ss e^(3-n) =2.46 e-2 m^(2-n)
% Equivalent Cylindrical Storativity = 9.17 e-2
% lambda = 4.8e-5
% omega = 2.59 e-4
% sigma fracture = 5


%% THIRD example for the GRF model (Barker, 1988)

% Reference data to validate the GRF model when n=2
% 
% Table 5.1, page 172 in:
% C.W. Fetter, 2001, Applied Hydrogeology, Fourth Edition.
% Prentice Hall, Upper Saddle River, 598 pp.
%       
% q=0.013888 m3/s
% r=250 m
% 
% With these data, the reference values obtained with the Theis model
% are the following:
%
% T = 1.425 e-3 m2/s
% S = 2.115 e-5
%

%% Load the data and plot the diagnostic
[t,s]=ldf('ths_ds1.dat');
diagnostic(t,s)

%% Prepare the model and fit it to the data
grf_pre(250,2);
p=grf_gss(t,s);  % The initial guess is incorrect
trial('grf',p,t,s) 

%% Automatic fit and final figure

p=fit('grf',p,t,s);
grf_rpt(p,t,s,[0.013888,250])

%% Demo example for the grf model (Barker, 1988)

% Source : Le Borgne, et al. 2004 WATER RESOURCES RESEARCH, VOL. 40, 
% W03512, doi:10.1029/2003WR002436, 2004 - Figure 8
%
% Data files:
% ===========
%  
% grf_ds3.dat :  time in seconds, drawdown in m
% 
% r = 40 m
% q = 34 m3/h = 9.444e-3 m3/s
%
% flow dimension n = 1.6
%
% Les valeurs de transmissivité ou emmagasinement ne sont pas données.
% Une interprétation avec WTFM donne.
% Ssf = 1.8 e-2 1/m
% Kf = 2.8 e-2 m/s
% bf = 1 m
% Reste à calculer les transmissivités équivalents ECT....


%% Load the data and plot the diagnostic
[t,s]=ldf('grf_ds3.dat');
t=t; % Conversion du temps en heure en temps en seconde
diagnostic(t,s)

%% Prepare the model and check the preliminary fit to the data
grf_pre(40,0.1);
p=grf_gss(t,s);
trial('grf',p,t,s) 

%% Automatic fit and final figure

p=fit('grf',p,t,s);
grf_rpt(p,t,s,[9.444e-3])

