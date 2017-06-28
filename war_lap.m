function s = war_lap( x, p)
%WAR_LAP - Warren and Root (1963) solution in  Laplace domain
%
% Syntax:
%   war_lap(x,p) provides the dimensionless drawdown at the well
%
%   x(1) = sigma
%   x(2) = lamda
%   p    = Laplace parameter
%
% See also: war_dls


s=x(1);
l=x(2);

s=1./p.*besselk(0,sqrt(p+(l.*s.*p)./(s.*p+l)));
