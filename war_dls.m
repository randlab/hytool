function sd = war_dls( x, td)
%WAR_DLS - Dimensionless drawdown of Warren and Root (1963) solution
%
% Syntax: war_dls(x,t)
%   x(1) = sigma 
%   x(2) = lamda
%   t = time
%
% Description:
%   Calculates the dimensionless drawdown
%
% References:
%   Warren, J. E., and P. J. Root (1963), The behaviour of naturally 
%   fractured reservoirs, Society of Petroleum Engineers Journal, 3, 
%   245-255.
%
% See also: war_lap

sd=stefhest('war_lap',x,td);
