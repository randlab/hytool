function p = waw_gss( t, s )
%WAW_GSS - First guess for the parameters of the WAW model
%
% Syntax: p = waw_gss(t,s)
%
%   p(1) = a  = slope of Jacob Straight Line
%   p(2) = t0 = intercept with the horizontal axis for 
%               the early time asymptote
%   p(3) = t1 = intercept with the horizontal axis for 
%               the late time asymptote
%   p(4) = tm = time of the minimum of the derivative
%   p(5) = CD = well-bore storage coefficient
%
%   t    = time
%   s    = drawdown
%
% Description: 
%   First guess for the parameters of the WAW model
%
%   See also: waw_dim, waw_rpt

n=length(t);
l=floor(n/4);
[td,d]=ldiffs(t,s,40);
dd=mean(d(end-l:end));
a=log(10)*dd;
t0=t(1)/exp(s(1)/dd);
t1=t(end)/exp(s(end)/dd);
[dmin,i]=min(d);
tm=td(i);


sp=s(s>0 & t>0);
tp=t(s>0 & t>0);
if( isempty(sp) )
    disp('HYTOOL: Error in pcw_gss - the vector t and s do not contain positive data');
    p=NaN;
    return
else
    cd=0.8905356*d(end)/sp(1)*tp(1)/t0;
end

p(1)=a;
p(2)=t0;
p(3)=t1;
p(4)=tm;
p(5)=cd;
