function p=hvs_gss( t, s)
%HVS_GSS - Estimate the parameters of the Hvorslev Model
%
% Syntax: p = hvs_gss( t, s)
%
% Description:
%   First guess for the parameters of the Hvorslev solution
%
% See also: hvs_dim, hvs_dmo, hvs_rpt
%


i=find((s>0.2)&(s<0.5));
t=t(i);
s=s(i);

[su,i]=unique(s);
tu=t(i);
p=interp1(s,t,0.37);