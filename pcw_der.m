function s = pcw_der( x, p)
%PCW_DER - Papadopulos-Cooper solution the well : Log derivative of the solution in Laplace domain
%                
% Syntax: s = pcw_der( x, p)
%   x[1] = Cd
%   p = Laplace parameter 
%
% See also: pcw_lap
%


sp=sqrt(p);
k0=besselk(0,sp);
k1=besselk(1,sp);
s=0.5.*((2.*x(1)-1).*k0.^2+k1.^2)./((sp.*k1+x(1).*p.*k0).^2);
