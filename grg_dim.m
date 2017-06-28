function s=grg_dim(p,t)
%GRG_DIM - Gringarten and Ramey (1974) solution 
%
% Syntax: s = grg_dim(p,t)
%   p(1) = a
%   p(2) = t0
%   t is the dimensionless time
%
% Description:
%   Infinite conductivity fracture in a confined aquifer
%
% Example:
%   s=grg_dim(p,t);
%
% See also: grg_dmo, grg_rpt, grg_gss
%

a=p(1);
t0=p(2);

u=t/t0;

s = a.*(2.*sqrt(pi*u).*erf(1./(2.*sqrt(u)))+expint(1./(4.*u))) ;