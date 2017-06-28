function p = ths_gss( t, s )
%THS_GSS - First guess for the parameters of the Theis model.
%
% Syntax:  p = ths_gss(t,s)
%
%   p(1) = a  = slope of Jacob straight line for late time
%   p(2) = t0 = intercept with the horizontal axis for s = 0
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of theis solution
%
% See also: ths_dim, ths_dmo, ths_rpt, ezwt
%

if( size(t,1)==1 )
    t=t';
    s=s';
end
n=round(length(t)./3);
t=t(n:end);
s=s(n:end);
p=jcb_gss(t,s);
