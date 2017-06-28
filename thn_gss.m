function p = thn_gss( t, s )
%THN_GSS - First guess for the parameters of the Theis model with a no-flow boundary
%
% Syntax: p = thn_gss(t,s)
%
%   p(1) = a  = slope of Jacob straight line 
%   p(2) = t0 = intercept of the Jacob straight line 
%   p(3) = ti = time of intersection between the 2 straight lines
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of theis solution with a no-flow
%   boundary
%
% See also: thn_dmo, thn_rpt, thn_dim
%


% Automatic identification of the "control" points
[td,d]=ldiffs(t,s);     % First log derivative
[tdd,dd]=ldiffs(td,d);  % second log derivative

% Calculation of the parameters of the model
[tmp,i]=max(dd);
ti=tdd(i);

% Slope of Jacob's straight line
a=d(end)*2.30/2;

% Origin of jacob straight line
t0=10^((a*log10(t(end)*t(end)/ti)-s(end))/a);


p(1)=a;
p(2)=t0;
p(3)=ti;
