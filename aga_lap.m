function s = aga_lap(x,p)
%AGA_LAP - Agarwal et al solution in  Laplace domain
%
% Syntax: aga_lap(x,p) 
%
%   x(1) = Cd
%   x(2) = rd
%   x(3) = sigma
%   p    = Laplace parameter
%
%   calculates the dimensionless drawdown in the aquifer
%
% See also: aga_dls
%


cd=x(1);
rd=x(2);
sg=x(3);

sp=sqrt(p);
k0=besselk(0,sp);
k1=besselk(1,sp);

s=besselk(0,rd.*sp)./(p.*(((1+p.*cd.*sg).*sp.*k1)+(cd.*p.*k0)));   %solution d'Agarwal dans le domaine de Laplace pour le rabattement dans l'aquifère


