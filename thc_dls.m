function s = thc_dls(p,t)
%THC_DLS - Theis dimensionless drawdown with a constant head boundary
%
% Syntax: s = thc_dls(p,t)
%
%   p(1) = r1/r2  
%   with r1 = radius to the pumping well 
%   and  r2 = radius to the image well 
%
%   provides the dimensionless drawdown at reduced time t
%
% See also: thc_dim, thc_lap

t=.25./t;
s=0.5*expint(t)-0.5*expint(t*p(1).^2);
