function [s] = blt_dls( x, t)
%BLT_DLS - Dimensionless drawdown of the Boulton model for an unconfined aquifer. 
%
% Syntax: s = blt_dls( x, t)
%
%   Dimensionless solution 
%        
%   x[1] = sigma = S / S_y
%   x[2] = phi   = ( alpha r^2 S ) / T 
%   t    = dimensionless time
%
% See also: blt_lap
%

s=stefhest('blt_lap',x,t);
