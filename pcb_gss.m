function p = pcb_gss(t,s)
%PCB_GSS - First guess for the parameters of the Papadopulos Cooper solution in the aquifer with two storativities
%
% Syntax: p = pcb_gss(t,s)
%
%   p(1) = a   = slope of Jacob straight line for late time
%   p(2) = t0  = intercept of the Jacob straight line for late time
%   p(3) = cd  = wellbore storage coefficient
%
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of the Papadopulos Cooper solution with
%   two storativities
%
% See also: pcb_dmo, pcb_pre, pcb_rpt, pcb_dim
%


[td,d]=ldiffs(t,s);
a=log(10)*d(end);
t0=t(end)*exp(-s(end)/d(end));

p(1)=a;
p(2)=t0;
p(3)=1e3;