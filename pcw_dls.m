function [s,ds] = pcw_dls( x, t)
%PCW_DLS - Papadopulos Cooper dimensionless solution in the well
%
% Syntax: [s,ds] = pcw_dls( x, t)
%
%   x(1) = Cd
%   t = time 
%
% Description:
%   Calculates the Dimensionless solution at the pumping well
%
%    Reference: Papadopulos, I.S., and H.H.J. Cooper. 1967. Drawdown in a
%    well of large diameter. Water Resources Research 3, no. 1: 241-244. 
%
% See also: pcw_lap
%


s=stefhest('pcw_lap',x(1),t);
ds=stefhest('pcw_der',x(1),t);
