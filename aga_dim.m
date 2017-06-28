function s = aga_dim(p,t)
%AGA_DIM - Computes drawdown with Agarwal et al. (1970) solution in the aquifer
%
% Syntax: s = aga_dim(p,t)
%
%   p(1) = a     : slope of the late time Jacob's straight line in m
%   p(2) = t0    : intercept with the horizontal axis for s = 0
%   p(3) = sigma : skin factor
%
%   t = time in seconds
%   s = drawdown in meters
%
% Description:
%   Computes drawdon in the aquifer for a constant rate pumping test in a 
%   large diameter well with skin effect. The aquifer is confined and
%   homogeneous.
%
%   The skin factor is equal to:
%
%   sigma = (T-Ts)/Ts * log( rs / rw )
%
%   with:
%   T  = transmissivity of the aquifer
%   Ts = transmissivity of the skin (perturbed zone around the well)
%   rs = radius of the skin (from the center of the well)
%   rw = radius of the well screen
%
%   Warning: The function can be used only if aga_pre has been 
%            called before to provide the radius of the well, casing, etc.
%
%   Reference: Agarwal, RG, R Al-Hussainy and HJ Ramey, 1970,
%   An investigation of wellbore storage and skin effect in unsteady
%   liquid flow. SPE Journal: 279-290
%
% example:
%   s=aga_dim(p,t);
%
% See also: aga_dmo, aga_pre, aga_rpt, aga_gss
%


global AGA_RW AGA_RC AGA_R AGA_Q

if(  isempty(AGA_RW) )
    disp(' ERROR: aga_dim: You must run AGA_PRE before using the aga model')
    p=[];
    return;
end

a=p(1);
t0=p(2);
sg=p(3);

rw=AGA_RW;
rc=AGA_RC;
r=AGA_R;
q=AGA_Q;

T=0.183*q/a;
S=2.25*T*t0/r.^2;
cd=rc.^2/2/rw.^2/S;

rd=r/rw;
td=0.445268.*t./t0.*rd.^2;

[sd]=aga_dls([cd,rd,sg],td); 

s=(2./log(10)).*a.*sd;

is=find(s<0);
s(is)=0;
