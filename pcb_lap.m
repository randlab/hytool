function s = pcb_lap( x, p)
%PCB_LAP - Papadopulos Cooper Function in Laplace domain in the aquifer solution in the aquifer
%
% Syntax: pcb_lap(x,p) provides the dimensionless drawdown
%
%   x(1) = Cd 
%   x(2) = dimensionless radius
%   p = Laplace parameter 
%
% See also: pcb_dls
%


cd=x(1);
rd=x(2);
sp=sqrt(p);

s=besselk(0,rd.*sp)./(p.*(sp.*besselk(1,sp)+cd.*p.*besselk(0,sp)));
