function s = thn_dim(p,t)
%THN_DIM - Theis model with a no-flow boundary
%
% Syntax: s = thn_dim(p,t)
%   p(1) = a  = slope of Jacob Straight Line
%   p(2) = t0 = intercept of the first segment of straight line
%   p(3) = ti = time of intersection between the 2 straight lines
%
% Description:
%   Calculate the drawdown at time t for confined aquifer with a no-flow
%   boundary
%
% Example:
%   s = thn_dim( p,t )
%
% See also: thn_dmo, thn_dim, thn_gss
%

a=p(1);
s=ths_dim([a,p(2)],t) + ths_dim([a,p(3)],t);
