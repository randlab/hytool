function p = pcw_gss( t, s )
%PCW_GSS - First guess for the parameters of the Papadopulos Cooper solution
%
% Syntax: p = pcw_gss(t,s)
%
%   p(1) = a   = slope of Jacob straight line for late time
%   p(2) = t0  = intercept of the Jacob straight line for late time
%   p(3) = Cd  = Dimensionless coefficient (1/2alpha)
%
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of Papadopulos Cooper solution
%
% See also: pcw_dim, pcw_dmo, pcw_rpt

if( isempty(t) || isempty(s) )
    disp('HYTOOL: Error in pcw_gss - the vector t and s must be provided');
    p=NaN;
    return
end

[td,d]=ldiffs(t,s);
if( d(end)>0 )
    a=log(10)*d(end);
    t0=t(end)*exp(-s(end)/d(end));
else
    p=ths_gss(t,s);
    a=p(1);
    t0=p(2);
end
if( t0 <= 0 )
    t0=1e-5;
end
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
p(3)=cd;
