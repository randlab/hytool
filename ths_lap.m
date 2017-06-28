function s = ths_lap(x,p)
%THS_LAP - Theis Function in Laplace domain
%
% Syntax:
%   ths_lap(x,p) provides the dimensionless drawdown
%
%   x = dummy parameter for stefhest algorithm
%   p = Laplace parameter
%
%   s = 1./p.*besselk(0,sqrt(p));
%
% See also: ths_dls
%

s=1./p.*besselk(0,sqrt(p));
