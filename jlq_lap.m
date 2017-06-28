function q = jlq_lap( x, p)
%JLQ_LAP - Jacob-Lohman Laplace domain solution in the well
%
% Syntax: q = jlq_lap( x, p)
%
%   p = Laplace parameter
%   Solution at the pumping well
%   q=1./(p.*besselk(0,sqrt(p)));
%
% See also: jlq_dls
%

  
sp = sqrt(p) ;
q  = besselk(1,sp)./(sp.*besselk(0,sp));

%solution van Everdingen + Hurst
%q  = besselk(1,sp)./(sp.*p.*besselk(0,sp));