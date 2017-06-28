function [s,d] = jcb_dim( p, t)
%JCB_DIM - Compute drawdwon with the Cooper and Jacob (1946) approximation 
%
% Syntax: [s,d] = jcb_dim( p, t) 
%
%   p(1) = a = slope of Jacob Straight Line
%   p(2) = b = intercept with y=0
%
%   t    = time
%   s    = drawdown
%   d    = logarithmic derivative
%
% Description:
%   Computes drawdown with the Cooper-Jacob (1946) late time approximation 
%   of the Theis (1935) solution. 
%
% Example:
%   s=jcb_dim([1,5e-1],50)
%
% See also: jcb_dmo, jcb_rpt, jcb_gss, ths_dim, ths_dmo

a=p(1);
b=p(2);

s=a*log10(t/b);
d=a./log(10).*ones(size(t));


