function sd=grf_lap(x,p)
%GRF_LAP - Laplace Dimensionless solution : Barker (1988) general radial flow model
%
% Syntax: sd=grf_lap(x,p)
%
%   x(1) = n is the fractional flow dimension
%
%   td is the dimensionless time
%
% See also: grf_dls
%


n=x(1);
rd=x(2);
sp=sqrt(p);
sd=rd.^(2-n).*(rd.^2.*p./4).^(n/4-0.5).*besselk(n/2-1,rd.*sp)./p./gamma(n/2);
