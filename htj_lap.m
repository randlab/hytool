function s = htj_lap( x, p)
%HTJ_LAP - Hantush-Jacob (1955) Function in Laplace domain 
%
% Syntax: s = htj_lap( x, p)
%
%   x(1) = r/B
%   p    = Dimensionless Laplace parameter 
%
% See also: htj_dls
%


a=x(1);
s=1./p.*besselk(0,sqrt(a^2+p));
