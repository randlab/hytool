function ds = pca_der( x, p)
%PCA_DER - Papadopulos-Cooper Derivative in Laplace domain in the aquifer
%
% Syntax: ds = pca_der( x, p)
%
%   x(1) = Cd 
%   x(2) = dimensionless radius
%   p = Laplace parameter 
%
% See also: pca_lap
%

cd=x(1);
rd=x(2);
sp=sqrt(p);
spr=rd.*sp;
cds=cd.*sp;
k0=besselk(0,sp);
pk0=p.*k0;
kr0=besselk(0,spr);
k1=besselk(1,sp);
kr1=rd.*besselk(1,spr);
spk1=sp.*k1;

ds=0.5.*((2*cd-1).*kr0.*k0+kr1.*k1+cds.*kr1.*k0-cds.*kr0.*k1)./((sp.*k1+cd.*p.*k0).^2);
