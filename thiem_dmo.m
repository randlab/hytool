%% Thiem method
% In this example, we show how to use the thiem function to 
% compute the transmissivity with the Thiem (1906) solution.
%
% Copyright 1998-2007 - Philippe Renard & Co. - GNU GENERAL PUBLIC LICENSE

%% Data set
% The data set for this example comes from the following reference: 
% Kruseman and de Ridder (1994), Analysis and Evaluation of Pumping Test
% Data. International Institute for Land Reclamation and Improvement,
% Wageningen. The Netherlands. 377 pp.
% Data set from table 3.2 pp. 56-60

%%
% General Information:
% Localisation: Test performed in 'Oude Korendijk' site, south of 
% Rotterdam, The Netherlands (Wit 1963).
% Geology : The well was screened in a aquifer 
% (coarse sand with some gravels) interbedded with two confining layers.

%% 
% The Thiem method requires to know the pumping rate and the drawdown in
% two observation wells located at different distances from the pumping
% well. Let us defined these values.

q=0.00912;  % well discharge in m3/s 
r1=0.8;     % distance piezometer 1 to pumping well in m
r2=30;      % distance piezometer 2 to pumping well in m
s1=2.236;   % drawdown in piezometer 1
s2=1.088;    % drawdown in piezometer 2

%% Use of the Thiem function
% We can then use the thiem function and compute the transmissivity :
% 
% T = 4.6 e-3 m2/s 

T= thiem(q,s1,s2,r1,r2)

%%
% The result found by Kruseman and de Rider was: T = 4.5 e-3 m2/s

