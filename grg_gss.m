function p = grg_gss( t, s )
%GRG_GSS - First guess for the parameters of the Gringarten model.
%
% Syntax:  p = grg_gss(t,s)
%
%   p(1) = a  = slope of Jacob straight line for late time
%   p(2) = t0 = intercept with the horizontal axis for s = 0
%
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of Gringarten solution.
%
% See also: grg_dim, grg_dmo, grg_rpt
%


n=round(size(t,1)./4);
t=t(n:end);
s=s(n:end);
p=jcb_gss(t,s);
