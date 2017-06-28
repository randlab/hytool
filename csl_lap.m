function s = csl_lap( cd, p)
%CSL_LAP - Cooper et al. (1967) Laplace domain solution for slug test
%
% Syntax: s = csl_lap( cd, p)
%
%   cd = dimensionless well-bore storage coefficient
%   p  = Laplace parameter 
%
%   Original Implementation with alpha cf. P. Hsieh
%
%   a=cd;
%   sp=sqrt(a*p);
% 
%   k0=besselk(0,sp);
%   s=k0./(p.*k0+2.*sp.*besselk(1,sp));
% 
% see also: csl_dls
%


sp=sqrt(p);
k0=besselk(0,sp);
s=cd.*k0./(cd.*p.*k0+sp.*besselk(1,sp));
