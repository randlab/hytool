function s = nsl_lap( cd, p)
%NSL_LAP - Neuzil (1982) Laplace domain solution for slug test (pulse)
%
% Syntax: s = nsl_lap( cd, p)
%
%   cd = dimensionless well-bore storage coefficient
%   p  = Laplace parameter 
%
% Description:
%   Original Implementation with alpha cf. P. Hsieh
%
%   a=x(1);
%   sp=sqrt(a*p);
% 
%   k0=besselk(0,sp);
%   s=k0./(p.*k0+2.*sp.*besselk(1,sp));
%
% See also: nsl_dls
%


sp=sqrt(p);
k0=besselk(0,sp);
s=cd.*k0./(cd.*p.*k0+sp.*besselk(1,sp));
