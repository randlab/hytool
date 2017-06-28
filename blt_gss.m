function p = blt_gss( t, s )
%BLT_GSS - First guess for the parameters of the Boulton model
%
% Syntax:  p = blt_gss(t,s)
%
%   p(1) = a  = slope of Jacob straight line for late time
%   p(2) = t0 = intercept with the horizontal axis for s = 0 for the early
%               asymptote
%   p(3) = t1 = intercept with the horizontal axis for s = 0 for the late
%               asymptote
%   p(4) = phi
%
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of Boulton solution.
%
% See also: blt_dmo, blt_rpt, blt_dim
%


p(2)=t(1);
n=round(size(t,1)./3);
t=t(n:end);
s=s(n:end);
pj=jcb_gss(t,s);
p(1)=pj(1);
p(3)=pj(2);
p(4)=1e-4;