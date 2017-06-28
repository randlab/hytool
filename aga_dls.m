function s = aga_dls( x, t)
%AGA_DLS - Dimensionless Agarwal solution in the aquifer
%
% Syntax: s = aga_dls(x,t)
%
%   x(1) = Cd 
%   x(2) = rd
%   x(3) = sigma 
%   t = time 
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
%   The dimensionless well bore storage coefficient is:
%
%   Cd = rc^2/(2 rw^2 S) 
%
%   with:
%   T  = transmissivity of the aquifer
%   Ts = transmissivity of the skin (perturbed zone around the well)
%   rs = radius of the skin (from the center of the well)
%   rw = radius of the well screen
%   S  = storativity of the aquifer
%
%   Reference: Agarwal, RG, R Al-Hussainy and HJ Ramey, 1970,
%   An investigation of wellbore storage and skin effect in unsteady
%   liquid flow. SPE Journal: 279-290
%   
% See also: aga_drw, aga_lap



s=dehoog('aga_lap',x,t);

%s=stefhest('aga_lap',x,t);
