function s = tmc_dim( p, t)
% TMC_DIM - Theis model with a constant head boundary for multiple rate
% tests (1935).
%
% Syntax: s = tmc_dim(p,t)
%
%   p(1) = b  = slope of Jacob Straight Line ( = 0.183/T )
%   p(2) = t0 = intercept with the horizontal axis for s = 0
%   p(3) = ti = time of intersection between the 2 straight lines
%
%   t = time
%   s = drawdown
%
% Description: 
%   Calculate the drawdown at time t for multiple rate tests with 
%   accounting for a constant head boundary. For this solution, 
%   quadratic head losses are not taken into account.
%
%   The function  tmc_pre  must be used to initialize the pumping rate
%   history before making any call to tmc_dim.
%
%   tmc_dim is designed to interpret drawdown within a piezometer 
%   during a step drawdown test. It can also be used to interpret
%   simultaneously multiple pumping and recoveries dataset.
%
% See also: tmc_dmo, tmc_pre, tmc_rpt, tmc_gss


global NBPUMPINGPERIOD BEGINTIME PUMPINGRATES
s=zeros(size(t));

for i=1:NBPUMPINGPERIOD
    is=find(t>BEGINTIME(i));
    s(is)=s(is)+thc_dim([p(1)*PUMPINGRATES(i),p(2),p(3)],t(is)-BEGINTIME(i));
end


