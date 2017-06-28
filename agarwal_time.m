function [ta,sa]=agarwal_time(tr,sr,d)
%AGARWAL_TIME - Computes equivalent Agarwal (1980) time for recovery tests.
%
% Syntax: [ta,sa]=agarwal_time(tr,sr,d)
%
%   ta = equivalent Agarwal (1980) time
%   sa = drawdown corresponding to the Agarwal time
%
%   tr = vector containing the time since the begining of the recovery
%   sr = corresponding drawdown during the recovery
%        the residual drawdown is defined as follows:
%        sr(tr) = s(tp) - s(tr)
%        It is equal to 0 when the the pumping stops and it increases
%        progressively when the aquifer recovers its equilibrium.
%
%   d  = describes the pumping periods. 
%
%     Two options are possible:
%      - for a single rate pumping test 
%          d = tp = duration of the pumping period
%
%      - for a multiple rate test  
%          d = q  = matrix describing the pumping rate history
%          The matrix q contains one line per pumping period, and two 
%          columns:
%             column 1 = time (since the begining of the test) at which the 
%                        period ends
%             column 2 = flow rate during the period
%
% Description:
%
%   Agarwal has shown in 1980 that recovery test can be interpreted with
%   the same solutions than pumping test if one interprets the residual
%   drawdown sr = s(t) - s(end of pumping) as a function of an equivalent
%   time that is computed from the pumping rates history. The theory is
%   based on the superposition principle.
%
%   Reference: Agarwal, R.G., 1980. A new method to account for producing
%   time effects when drawdown type curves are used to analyse pressure 
%   buildup and other test data. Proceedings of the 55th Annual Fall 
%   Technical Conference and Exhibition of the Society of Petroleum 
%   Engineers. Paper SPE 9289
%
% Example:
%   The following example shows how to compute the Agarwal time for the
%   recovery after a constant rate test that lasted 1500 seconds.
%
%   [ta,sa] = agarwal_time( tr, sr, 1500 ); 
%
%   This other example shows how to compute the Agarwal time for the
%   recovery after a three steps variable rate test. In that case, the
%   matrix q specifies that the pumping rate was 1 m3/s during the first 1800
%   seconds, then 2 m3/s for the time between 1800 and 8000 seconds, and
%   then it was 0.6 m3/s until the end of the pumping period at 13000 s.
%
%   q=[1800,1; 8000,2; 13000,0.6];
%   [ta,sa] = agarwal_time( tr, sr, q );  
%
% See also: agarwal_dmo, tmr_dim

n=size(d,1);
if( n==1 )
    ta= d*tr./(d+tr);
else
	tp=d(:,1);
	qp=d(:,2);
	ta=tp(n-1)./(tr+tp(n-1)).^(qp(1)./(qp(n-1)-qp(n)));
    for j=2:n-1;
        ta=ta.*((tp(n-1)-tp(j-1))./(tr+tp(n-1)-tp(j-1))).^((qp(j)-qp(j-1))./(qp(n-1)-qp(n)));
    end
	ta=ta.*tr;
end

% For late time, the agarwal time all converge to the same time values.
% This creates duplicates that need to be removed.
[ta,i]=unique(ta);
sa=sr(i);