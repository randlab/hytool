function p = war_gss( t, s )
%WAR_GSS - First guess for the parameters of the Warren and Root solution
%
% Syntax: p = war_gss(t,s)
%
%   p(1) = a  = slope of Jacob Straight Line
%   p(2) = t0 = intercept with the horizontal axis for 
%               the early time asymptote
%   p(3) = t1 = intercept with the horizontal axis for 
%               the late time asymptote
%   p(4) = tm = time of the minimum of the derivative
%
%   t    = time
%   s    = drawdown
%
% Description: 
%   First guess for the parameters of the Warren and Root solution
%
%   See also: war_dmo, war_dim, war_rpt


[td,d]=ldiffs(t,s,40);
dd=mean(d(end-3:end));
a=log(10)*dd;
t0=t(1)/exp(s(1)/dd);
t1=t(end)/exp(s(end)/dd);
[dmin,i]=min(d);
tm=td(i);

p(1)=a;
p(2)=t0;
p(3)=t1;
p(4)=tm;
