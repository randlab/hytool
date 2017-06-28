function s = pcw_lap( x, p)
%PCW_LAP - Papadopulos Cooper Laplace domain solution in the well
%
% Syntax: s = pcw_lap( x, p)
%
%   x[1] = Cd
%   p = Laplace parameter 
%
% Description:
%   Solution at the pumping well: 
%
%                           K0( sqrt(p) )
%  s = --------------------------------------------------------
%       p [ sqrt(p)*K1( sqrt(p) ) + Cd * p * K0( sqrt(p) ) ]
%
% See also: pcw_dls
%


sp=sqrt(p);
k0=besselk(0,sp);
s=k0./(p.*(sp.*besselk(1,sp)+p.*x(1).*k0));
