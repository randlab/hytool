function sd = waw_dls( x, td)
%WAW_DLS - Warren and Root with Well bore storage dimensionless solution in the well
%
% Syntax: [s,ds] = waw_dls( x, td)
%
%   x(1) = sigma
%   x(2) = lamda
%   x(3) = Cd
%   t = dimensionless time 
%
% Description:
%   Calculates the Dimensionless solution at the pumping well when the
%   aquifer displays a double porosity behavior
%
% References:
%   Papadopulos, I.S., and H.H.J. Cooper. 1967. Drawdown in a
%   well of large diameter. Water Resources Research 3, no. 1: 241-244. 
%
%   Warren, J. E., and P. J. Root (1963), The behaviour of naturally 
%   fractured reservoirs, Society of Petroleum Engineers Journal, 3, 
%   245-255.
%
% See also: waw_lap

sd=stefhest('waw_lap',x,td);
