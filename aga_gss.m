function p = aga_gss(t,s)
%AGA_GSS  - First guess for the parameters of the Agarwal solution
%
% Syntax: p = aga_gss(t,s)
%
%   p(1) = a   = slope of Jacob straight line for late time
%   p(2) = t0  = intercept of the Jacob straight line for late time
%   p(3) = sg  = skin factor
%   
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of Agarwal solution.
%
% See also: aga_dmo, aga_pre, aga_rpt, aga_dim


global AGA_RW AGA_RC AGA_R AGA_Q

rw=AGA_RW;
rc=AGA_RC;
r=AGA_R;
q=AGA_Q;

sg=1;

id=floor(max(size(t))/3*2);
p=ths_gss(t(id:end),s(id:end));

[td,d]=ldiffs(t,s);
a=log(10)*d(end);
t0=t(end)*exp(-s(end)/d(end));

p(1)=a;
p(2)=t0;
p(3)=sg;
