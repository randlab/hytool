function s = htj_dim( p, t)
%HTJ_DIM - Hantush and Jacob (1955) solution
%
% Syntax: s = htj_dim( p, t)
%  
%   p(1) = a
%   p(2) = t0
%   p(3) = r/B
%   t    = time 
%
% Description:
%   Confined aquifer with leakage
%
% Example:
%   s=htj_dim(p,t);
%
% See also: htj_dmo, htj_rpt, htj_gss
%


a=p(1);
t0=p(2);
rd=p(3);

s=htj_dls(rd,0.445268.*t./t0);

s=0.868589.*a.*s;
