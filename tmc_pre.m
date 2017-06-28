function tmc_pre( q ) 
% TMC_PRE  -  Pre-processing : initialize the multiple rate Theis drawdown function
% 
% Syntax: tmc_pre( q ) 
%
%   q = matrix describing the pumping periods
%   size = nb of lines = nb of pumping periods two colums
%  
%   column 1 = time (since the begining of the test) 
%              at which the period ends
%   column 2 = flow rate during the period
%
% Description: 
%   tmc stands for Theis Multiple Rates with a constant head boundary
%   test.The function  tmc_pre  must be used to initialize the pumping
%   rate history before making any call to tmc_dim or tmc_rpt.
%
%   For a test that includes recovery periods, the second column should 
%   simply contain a zero during theses periods.
%
% See also: tmc_dmo, tmc_gss, tmc_dim, tmc_rpt


global NBPUMPINGPERIOD ENDINGTIME BEGINTIME PUMPINGRATES QMATRIX

QMATRIX=q;
NBPUMPINGPERIOD=size(q,1);
BEGINTIME=[0;q(1:end-1,1)];
PUMPINGRATES=[q(1,2);diff(q(:,2))];
