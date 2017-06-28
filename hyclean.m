function [t,s]=hyclean(t,s)
%HYCLEAN - Take only the values that are finite and strictly positive time
%                
% Syntax: [tc,sc] = hyclean( t,s )
%
% Description:
%   Take only the values that are finite and strictly positive time 
%          
% Example:
%   [tc,sc] = hyclean( t,s )
%
% See also: hyselect, hysampling, hyfilter, hyplot


i=find(isfinite(s));
t=t(i);
s=s(i);

i=find(t>0 & s>0);
t=t(i);
s=s(i);

[t,i]=unique(t);
s=s(i);