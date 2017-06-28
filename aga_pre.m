function aga_pre(rw,rc,r,q)
%AGA_PRE - Initialize the data required for aga_dim and aga_rpt
%
% Syntax: d = aga_pre(rw,rc,r,q)
%
%   rw = radius of the well in meters
%   rc = radius of the casing in meters
%   r  = distance [m] between the observation well and well pumping well 
%   q  = pumping rate in m3/s
%
% Description: 
%   aga stands for Agarwal et al. (1970) solution for a constant rate 
%   pumping test large diameter well with skin effect. The function  
%   aga_pre  must be used to initialize the pumping rate history before
%   making any call to aga_dim or aga_rpt.
%
% See also: aga_dmo, aga_dim, aga_rpt, aga_gss
%


global AGA_RW AGA_RC AGA_R AGA_Q

AGA_RW=rw;
AGA_RC=rc;
AGA_R=r;
AGA_Q=q;
