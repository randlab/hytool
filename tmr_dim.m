function s = tmr_dim( p, t)
% TMR_DIM - Theis model for multiple rate tests (1935)
%
% Syntax: s = tmr_dim( p, t) 
%   p(1) = b  = slope of Jacob Straight Line ( = 0.183/T )
%   p(2) = t0 = intercept with the horizontal axis for s = 0
%   t = time
%   s = drawdown
%
% Description: 
%   Calculate the drawdown at time t for multiple rate tests without 
%   accounting for quadratic head losses.
%
%   The function  tmr_pre  must be used to initialize the pumping rate
%   history before making any call to tmr_dim.
%
%   tmr_dim is designed to interpret drawdown within a piezometer during
%   a step drawdown test.It can also be used to interpret simultaneously 
%   the pumping and recovery data.
%
% Example:
%    s = tmr_dim( p,t )
%
% See Also: tmr_dmo, tmr_pre, tmr_rpt, tmr_gss

global NBPUMPINGPERIOD BEGINTIME PUMPINGRATES

if(  isempty(NBPUMPINGPERIOD) )
    disp(' ERROR: tmr_dim: You must run TMR_PRE before using the tmr model')
    p=[];
    return;
end

s=zeros(size(t));
for i=1:NBPUMPINGPERIOD
    is=find(t>BEGINTIME(i));
    s(is)=s(is)+ths_dim([p(1)*PUMPINGRATES(i),p(2)],t(is)-BEGINTIME(i));
end

