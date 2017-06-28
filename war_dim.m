function s = war_dim( p, t)
%WAR_DIM - Warren and Root (1965) solution
%
% Syntax: s = war_dim( p, t)
%
%   p(1) = a  = slope of Jacob Straight Line
%   p(2) = t0 = intercept with the horizontal axis for 
%               the early time asymptote
%   p(3) = t1 = intercept with the horizontal axis for 
%               the late time asymptote
%   p(4) = tm = time of the minimum of the derivative
%
% Description:
%   Calculate the drawdown at time t for confined aquifer with double 
%   porosity 
%
% Example:
%   s=war_dim(p,t)
%
% See also: war_dmo, war_rpt, war_gss
%

a=p(1);
t0=p(2);
t1=p(3);
tm=p(4);

td=0.445268.*t./t0;
sigma=(t1-t0)./t0;
lambda=2.2458394*t0*log(t1/t0)./tm;
sd=war_dls([sigma,lambda],td);
s=0.868589.*a.*sd;