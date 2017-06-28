function s = waw_lap( x, p)
%WAW_LAP - Warren and Root with Well bore storage dimensionless solution
%
% Syntax:
%   waw_lap(x,p) provides the dimensionless drawdown at the well
%
%   x(1) = sigma
%   x(2) = lamda
%   x(3) = Cd
%   p    = Laplace parameter
%
% References:
%   Papadopulos, I.S., and H.H.J. Cooper. 1967. Drawdown in a
%   well of large diameter. Water Resources Research 3, no. 1: 241-244. 
%
%   Warren, J. E., and P. J. Root (1963), The behaviour of naturally 
%   fractured reservoirs, Society of Petroleum Engineers Journal, 3, 
%   245-255.
%
% See also: waw_dls

s=x(1);
l=x(2);
cd=x(3);

alpha=sqrt(p+(l.*s.*p)./(s.*p+l));

k0=besselk(0,alpha);
s=k0./( p.*( p.*cd.*k0+ alpha.*besselk(1,alpha)) );
