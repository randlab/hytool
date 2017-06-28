function s = thn_dls(p,t)
%THN_DLS - Dimensionless drawdown of the Theis model with a no-flow boundary
%
% Syntax: s = thn_dls(p,t)
%
%   p(1) = r1/r2  
%   with r1 = radius to the pumping well 
%   and  r2 = radius to the image well 
%
%   provides the dimensionless drawdown at reduced time t
%
% See also:
%


t=.25./t;
s=0.5*expint(t)+0.5*expint(t*p(1).^2);
