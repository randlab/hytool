function ds =ths_der(x,p)
%THS_DER - Derivative of the Theis Function in Laplace domain
%
% Syntax: ds =ths_der(x,p)
%   x = dummy parameter for stefhest algorithm
%   p = Laplace parameter
%
% See also: ths_lap, ths_jac
%

ds=0.5*besselk(1,sqrt(p))./sqrt(p);
