function s = pcb_dls(x,t)
%PCB_DLS - Papadopulos- -Cooper dimensionless solution in the aquifer with two storativities
%
% Syntax: [s,ds] = pcb_dls( x, t)
%   x(1) = Cd
%   x(2) = rd
%   t = time 
%
% Description:
%   Calculates the dimensionless drawdown s and the dimensionless 
%   derivative ds for a given dimensionless reduced time td/rd^2
%
% See also: pcb_lap
%


s=stefhest('pcb_lap',x,t,16);
