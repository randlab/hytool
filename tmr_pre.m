function tmr_pre( q ) 
% TMR_PRE  -  Pre-processing : initialize the multiple rate Theis drawdown function
% 
% Syntax: tmr_pre( q ) 
%
%   q = matrix describing the pumping periods
%   size = nb of lines = nb of pumping periods two colums
%  
%   column 1 = time (since the begining of the test) at which the 
%              period ends
%   column 2 = flow rate during the period
%
%   For a test that includes recovery periods, the second column should
%   simply contain a zero during theses periods.
%
% Description: 
%   This function initialize the multiple rate Theis drawdown function. It
%   must be called before any call to tmr_dim, or tmr_tst.
%   Tmr stands for Theis Multiple Rates.
%
% See also: tmr_dmo, tmr_dim, tmr_rpt, tmr_gss

global NBPUMPINGPERIOD BEGINTIME PUMPINGRATES QMATRIX

QMATRIX=q;
NBPUMPINGPERIOD=size(q,1);
BEGINTIME=[0;q(1:end-1,1)];
PUMPINGRATES=[q(1,2);diff(q(:,2))];
