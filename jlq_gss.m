function p = jlq_gss( t, q )
%JLQ_GSS - First guess for the parameters of the Jacob and Lohman model
%
% Syntax:  p = jlq_gss(t,q)
%
%   p(1) = b  = slope of normalized Jacob straight line for late time
%   p(2) = t0 = intercept with the horizontal axis for s = 0
%
%   t    = time
%   q    = discharge
%
% Description:
%   First guess for the parameters of Jacob and Lohman solution
%
% See also: jlq_dim, jlq_dmo, jlq_rpt
%


n=round(size(t,1)./3);
if n==0
    n=round(size(t,2)./3);
    t=t';
    q=q';
end
t=t(n:end);
s=1./q(n:end);
p=jcb_gss(t,s);
