function s = blt_lap( x, p)
%BLT_LAP - Boulton (1963) Laplace dimensionless domain solution 
%
% Syntax: s = blt_lap( x, p)
%
%   x[1] = sigma = S / S_y
%   x[2] = phi   = ( alpha r^2 S ) / T 
%   p    = Laplace parameter 
%
% See also: blt_dls
%


s=besselk(0, sqrt( p + x(2).*p./(x(1).*(p+x(2)))) )./p;
