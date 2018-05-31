%% Data set
% The data set for this example comes from the following reference: 
% Kruseman & de Ridder (1994), Analysis and Evaluation of Pumping Test
% Data. International Institute for Land Reclamation and Improvement,
% Wageningen. The Netherlands. 377 pp.
% Data set from table 4.1 p77

%%
% General Information:
% Localisation: Test performed in 'Dalem' site (de Ridder 1961).

%% 
% The fitted de Glee method requires to know the pumping rate and the drawdown in
% at least two observation wells located at different distances from the pumping
% well. 

q=0.0088;                             % well discharge in m3/s
% r = [10;30;60;90;120];              % observation well distances in m
% s = [.31;.235;.17;.147;.132];       % drawdown in m
[r,s] = ldf('deg_ds1.dat');


%% Use of the deg_fit function
% We can then use the deg_fit function (Holzbecher) and compute transmissivity & resistence : 
% T = 1.9e-2 m2/s, c = 1.8e7 s 

[T,c] = deg_fit (q,r',s')

%%
% The result found by Kruseman & de Ridder was: T = 2.46e-2 m2/s, c = 4.9e7 s