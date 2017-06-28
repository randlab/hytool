function s = waw_dim( p, t)
%WAW_DIM - Warren and Root (1965) with Well Bore storage
%
% Syntax: s = waw_dim( p, t)
%
%   p(1) = a  = slope of Jacob Straight Line
%   p(2) = t0 = intercept with the horizontal axis for 
%               the early time asymptote
%   p(3) = t1 = intercept with the horizontal axis for 
%               the late time asymptote
%   p(4) = tm = time of the minimum of the derivative
%   p(5) = Cd = dimensionless well bore storage coefficient
%
% Description:
%   Calculate the drawdown in the pumping well
%   at time t for a confined aquifer with double 
%   porosity and well bore storage
%
% Example:
%   s=waw_dim(p,t)
%
% References:
%   Papadopulos, I.S., and H.H.J. Cooper. 1967. Drawdown in a
%   well of large diameter. Water Resources Research 3, no. 1: 241-244. 
%
%   Warren, J. E., and P. J. Root. 1963. The behaviour of naturally 
%   fractured reservoirs, Society of Petroleum Engineers Journal, 3, 
%   245-255.
%
% See also: waw_rpt, waw_gss
%

a=p(1);
t0=p(2);
t1=p(3);
tm=p(4);
cd=p(5);

td=0.445268.*t./t0;
sigma=(t1-t0)./t0;
lambda=2.2458394*t0*log(t1/t0)./tm;
sd=waw_dls([sigma,lambda,cd],td);
s=0.868589.*a.*sd;