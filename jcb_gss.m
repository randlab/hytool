function p = jcb_gss( t, s, tmin, tmax)
%JCB_GSS  - Linear Least Square fitting of Jacob solution
%
% Syntax: p = jcb_gss(t,s,tmin,tmax)
%
%   p(1) = a  = slope of Jacob straight line
%   p(2) = t0 = intercept of the Jacob straight line
%
%   t    = time 
%   s    = drawdown
%   tmin = optional argument: start of the fitting period
%   tmax = optional argument: end   of the fitting period
%
% Description:
%   First guess for the parameters of Jacob solution
%
% See also: jcb_dim, jcb_dmo, jcb_rpt
%


if(nargin<=2)   % Default value
  tmin=t(1);
end
if(nargin<=3)   % Default value 
  tmax=t(end);
end

i=find(isnan(s));  % The inversion will crash if there are NaN
s(i)=[];
t(i)=[];

i=find(t<tmin);
t(i)=[];
s(i)=[];

i=find(t>tmax);
t(i)=[];
s(i)=[];

%%%%%%%%%%%%%%%% This is the only calculation !

g=[log10(t),ones(size(t,1),1)];
p=inv(g'*g)*g'*s;

%%%%%%%%%%%%%%%%% 

a=p(1);
c=p(2);
t0=10^(-c/a);
p(2)=t0;
