function s=hvs_dim( p, t)
%HVS_DIM - Hvorslev (1951) Solution for a slug test
% 
% Syntax: sd = hvs_dim( p, t)
%
%   sd = dimensionless drawdown = s/s0
%   t  = time [s]
%   p  = parameter t0 [s]
% 
%   The Hvorslev (1951) model is simply sd = exp( -t/t0 )
%
% Description:
%   Solution for slug test in confined aquifer with negligible storage.
%
% Example:
%   s=hvs_dim(p,t);
%
% See also: hvs_dmo, hvs_rpt, hvs_gss
%


s=exp(-t./p );