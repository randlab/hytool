function s = htj_dls( x, td)
%HTJ_DLS - Hantush dimensionless solution
%
% Syntax: s = htj_dls( x, td)
%   x(1) = r/B
%   td = time 
%
% Description:
%  
%
% See also: htj_lap
%


s=stefhest('htj_lap',x(1),td);
