function p = htj_gss( t, s)
%HTJ-GSS - First guess for the parameters of the Hantush and Jacob (1955) solution
%
% Syntax: p = htj_gss( t, s)
%  
%   p(1) = a
%   p(2) = t0
%   p(3) = r/B
%
%   t    = time 
%   s    = drawdown 
%
% Description:
%   First guess for the parameters of Hantush solution in confined aquifer
%   with leakage.
%
% See also: htj_dim, htj_dmo, htj_rpt
%



n=floor(max(size(t,1))/3);
p=ths_gss( t(1:n), s(1:n) );
p=fit('ths', p, t(1:n), s(1:n) );

sm=s(end);
x=exp(-sm/p(1)*2.3/2+0.1);
if(x>1)
    x=-log(sm/p(1)*2.3/2);
end
p(3)=x;

