function s = pca_lap( x, p)
%PCA_LAP - Papadopulos-Cooper Function in Laplace domain in the aquifer.
%
% Syntax: s = pca_lap( x, p)
%
%   x(1) = Cd 
%   x(2) = dimensionless radius
%   p = Laplace parameter 
%
% See also: pca_dls
%



cd=x(1);
rd=x(2);
sp=sqrt(p);

s=besselk(0,rd.*sp)./(p.*(sp.*besselk(1,sp)+cd.*p.*besselk(0,sp)));
